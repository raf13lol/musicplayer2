function ia_get_vertical_dir()
{
    INLINE_FUNCTION;
    return ia_check_pressed(vk_down) - ia_check_pressed(vk_up)
}