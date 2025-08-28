; Simple URL Shortener in x86-64 Assembly (Linux)
; This is a demonstration - not fully functional without proper OS syscalls

section .data
    msg_short db 'Short URL: ABC123', 10, 0
    msg_original db 'Original URL: https://www.example.com', 10, 0
    
section .bss
    urls resb 1024          ; Simple buffer for URLs
    
section .text
    global _start
    
_start:
    ; Print short URL message  
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, msg_short      ; message
    mov rdx, 18             ; length
    syscall
    
    ; Print original URL message
    mov rax, 1              ; sys_write  
    mov rdi, 1              ; stdout
    mov rsi, msg_original   ; message
    mov rdx, 37             ; length
    syscall
    
    ; Exit program
    mov rax, 60             ; sys_exit
    mov rdi, 0              ; exit status
    syscall

; Note: This is a simplified demo showing the concept
; A full implementation would need proper string handling,
; random number generation, and data structure management
