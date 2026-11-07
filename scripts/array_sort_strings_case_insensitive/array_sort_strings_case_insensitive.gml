function array_sort_strings_case_insensitive(left, right)
{
    left = string_lower(left);
    right = string_lower(right);
    
    var left_len = string_length(left);
    var right_len = string_length(right);
    
    var len = min(left_len, right_len);
    for (var i = 1; i <= len; i++)
    {
        var diff = sign(string_ord_at(left, i) - string_ord_at(right, i));
        if (diff != 0)
            return diff;
    }
    
    return sign(left_len - right_len);
}