function wrap_value(value, min_value, max_value)
{
    var range_size = (max_value - min_value) + 1;
    
    while (value > max_value)
        value -= range_size;
    while (value < min_value)
        value += range_size;
    
    return value;
}