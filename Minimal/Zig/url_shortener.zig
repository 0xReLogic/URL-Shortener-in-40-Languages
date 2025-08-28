const std = @import("std");
const ArrayList = std.ArrayList;
const HashMap = std.HashMap;

const URLMapping = struct {
    short: []const u8,
    url: []const u8,
};

const URLShortener = struct {
    urls: ArrayList(URLMapping),
    allocator: std.mem.Allocator,

    const Self = @This();

    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .urls = ArrayList(URLMapping).init(allocator),
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *Self) void {
        self.urls.deinit();
    }

    pub fn shorten(self: *Self, url: []const u8) ![]const u8 {
        const short = try self.generateShortCode(6);
        try self.urls.append(URLMapping{ .short = short, .url = url });
        return short;
    }

    pub fn getUrl(self: *Self, short: []const u8) ?[]const u8 {
        for (self.urls.items) |mapping| {
            if (std.mem.eql(u8, mapping.short, short)) {
                return mapping.url;
            }
        }
        return null;
    }

    fn generateShortCode(self: *Self, length: usize) ![]const u8 {
        const characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var short = try self.allocator.alloc(u8, length);
        var rng = std.rand.DefaultPrng.init(std.time.milliTimestamp());
        
        for (short) |*c| {
            c.* = characters[rng.random().intRangeAtMost(usize, 0, characters.len - 1)];
        }
        return short;
    }
};

// Example usage
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    
    var shortener = URLShortener.init(gpa.allocator());
    defer shortener.deinit();

    const short = try shortener.shorten("https://www.example.com");
    std.debug.print("Short URL: {s}\n", .{short});
    
    if (shortener.getUrl(short)) |original| {
        std.debug.print("Original URL: {s}\n", .{original});
    }
}
