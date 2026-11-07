function song_finder_generate_combined_directories()
{
    INLINE_FUNCTION;
    global.sf_combined_directories = array_concat(
        global.sf_recursive_directories, 
        global.sf_non_recursive_directories
    );    
}