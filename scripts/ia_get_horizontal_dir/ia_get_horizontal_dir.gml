function ia_get_horizontal_dir()
{
    INLINE_FUNCTION;
    return ia_check_pressed(vk_right) - ia_check_pressed(vk_left);
}