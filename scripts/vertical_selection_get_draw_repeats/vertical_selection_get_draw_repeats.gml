function vertical_selection_get_draw_repeats(index, height, length)
{
    INLINE_FUNCTION;
    return min(height, length - index);
}