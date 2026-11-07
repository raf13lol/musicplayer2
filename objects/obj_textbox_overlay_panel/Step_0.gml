event_inherited();
if (!is_focused())
    exit;

textbox_update();
if (keyboard_check_pressed(vk_escape))
{
    keyboard_clear(vk_escape);
    if (!is_undefined(on_cancel))
        on_cancel();
    hide();
    exit;
}