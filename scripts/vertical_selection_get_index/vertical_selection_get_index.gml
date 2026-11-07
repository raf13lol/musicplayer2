function vertical_selection_get_index(selected, height, length)
{
    INLINE_FUNCTION;
    return clamp(selected - height div 2, 0, max(length - height + 1, 0));
}