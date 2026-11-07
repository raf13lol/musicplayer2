function plays_create_song(year, month, song_path)
{
    var year_struct = plays_create_year(year); 
    var month_struct = plays_create_month(year, month); 
    
    if (struct_exists(month_struct, song_path))
        return month_struct;
    
    month_struct[$ song_path] = 0;
    return month_struct;
}