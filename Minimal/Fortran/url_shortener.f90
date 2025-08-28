program url_shortener
    implicit none
    
    type :: url_entry
        character(len=6) :: short_code
        character(len=200) :: url
    end type url_entry
    
    type(url_entry), dimension(100) :: urls
    integer :: num_urls = 0
    character(len=6) :: short
    character(len=200) :: original_url
    
    ! Example usage
    original_url = 'https://www.example.com'
    short = shorten_url(original_url)
    
    write(*,*) 'Short URL: ', trim(short)
    write(*,*) 'Original URL: ', trim(get_original_url(short))
    
    contains
    
    function shorten_url(url) result(short_code)
        character(len=*), intent(in) :: url
        character(len=6) :: short_code
        
        ! Simple deterministic short code generation
        short_code = 'F90ABC'
        
        ! Store in our "database"
        num_urls = num_urls + 1
        urls(num_urls)%short_code = short_code
        urls(num_urls)%url = url
    end function shorten_url
    
    function get_original_url(short_code) result(url)
        character(len=6), intent(in) :: short_code
        character(len=200) :: url
        integer :: i
        
        url = 'NOT FOUND'
        do i = 1, num_urls
            if (urls(i)%short_code == short_code) then
                url = urls(i)%url
                exit
            end if
        end do
    end function get_original_url
    
end program url_shortener
