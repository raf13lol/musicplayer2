if (toggle_key != vk_nokey)
{
    if (!struct_exists(global.settings.keybinds.panels, panel_id))
        throw "wtf ????";
    toggle_key = global.settings.keybinds.panels[$ panel_id];
}

ini_open(PANELS_INI_FILE);

if (overlay)
{
    depth = -999;
    visible = default_visible && !ini_read_real(panel_id, "seen", false);
}
else
    visible = ini_read_real(panel_id, "visible", default_visible);

ini_close();