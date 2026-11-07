function song_finder_run()
{
    global.sf_allowed_formats = [
        "aif", "aiff", "asf", 
        "wma", "wmv", 
        "wav", "flac", "raw",
        "it", "mid", "midi", "mod", "xm", "s3m", 
        "mp2", "mp3", "ogg"
    ];
    
    
    global.sf_recursive_directories = [];
    global.sf_non_recursive_directories = [];
    
    global.sf_combined_directories = [];
    
    global.sf_songs_found = [];
    global.sf_relative_songs_found = [];
    
    song_finder_read_file_to_dirs("recursivedirs.txt", global.sf_recursive_directories);
    song_finder_read_file_to_dirs("nonrecursivedirs.txt", global.sf_non_recursive_directories);
    song_finder_generate_combined_directories();
    
    song_finder_scan_dirs(global.sf_recursive_directories, true);
    song_finder_scan_dirs(global.sf_non_recursive_directories, false);
}