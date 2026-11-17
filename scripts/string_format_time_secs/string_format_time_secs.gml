function string_format_time_secs(seconds)
{
    var s = string_format_zero(seconds % 60, 2, 0);
    var raw_minutes = seconds div 60;
    
    var m = string_format_zero(raw_minutes % 60, 2, 0);
    var h = string(raw_minutes div 60);
    
    return $"{h}:{m}:{s}";
}