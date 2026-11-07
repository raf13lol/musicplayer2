event_inherited();
if (!is_focused())
    exit;

global.panel_disable_switch = search_selected && global.settings.search_locks_panel;

if (keyboard_check(vk_control) && keyboard_check(vk_shift) && keyboard_check_pressed(search_key))
    search_selected = !search_selected;

vertical_selection_update(search_results_length, grid_height);
textbox_update(search_selected);