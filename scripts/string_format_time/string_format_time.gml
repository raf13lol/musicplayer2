function string_format_time(milliseconds)
{
    var ms = string_format_zero((milliseconds % 1000) div 10, 2, 0);
    
    var raw_seconds = milliseconds div 1000;
    var s = string_format_zero(raw_seconds % 60, 2, 0);
    
    var raw_minutes = raw_seconds div 60;
    
    var h = "";
    var m;
    if (raw_seconds >= 60 * 60)
    {
        var raw_hours = raw_minutes div 60;
        h = string(raw_hours) + ":";
        m = string_format_zero(raw_minutes % 60, 2, 0);
    }
    else
        m = string(raw_minutes % 60);
    
    return $"{m}:{s}.{ms}";
}