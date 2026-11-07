function ia_check_select_pressed()
{
    INLINE_FUNCTION;
    return ia_check_pressed(vk_space) || ia_check_pressed(vk_enter);
}