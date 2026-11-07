function string_format_zero(val, tot, dec)
{
    INLINE_FUNCTION;
    return string_replace(string_format(val, tot, dec), " ", "0");
}