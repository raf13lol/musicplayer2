function settings_init()
{
    global.settings = {
        font_index: 0,
        presence_level: "playing",
        default_search_open: true,
        search_locks_panel: false,
        percentage_played_needed: 30,
        
        keybinds: {
            panels: {
                currently_playing: "f1",
                queue: "f2",
                playlist: "f3",
                search: "f4",
                plays: "f5",
            },
            alt_media: {
                play_pause: "pause",
                stop: "end",
                previous_track: "pageup",
                next_track: "pagedown",
            },
            switch_panel: "tab",
            toggle_search: "s"
        }    
    };
    
    var json = global.settings;
    if (file_exists(SETTINGS_JSON_FILE))
        json = json_parse(file_text_read_all(SETTINGS_JSON_FILE));
    else
        file_text_write_all(SETTINGS_JSON_FILE, json_stringify(global.settings, true));
    
    // special
    var pdl = settings_get_value(json, "presence_level", global.settings.presence_level);
    var pdl_value = settings_string_to_presence_detail_level(pdl);
    global.settings.presence_level = pdl_value;
    
    var keybinds = settings_get_value(json, "keybinds", global.settings.keybinds);
    settings_init_keybinds(global.settings.keybinds, keybinds);
    
    // bools
    global.settings.default_search_open = settings_get_value(json, "default_search_open", global.settings.default_search_open);
    global.settings.search_locks_panel = settings_get_value(json, "search_locks_panel", global.settings.search_locks_panel);
    
    // reals
    global.settings.font_index = settings_get_value(json, "font_index", global.settings.font_index) 
    global.settings.percentage_played_needed = settings_get_value(json, "percentage_played_needed", global.settings.percentage_played_needed);
    
    // validation
    global.settings.font_index = clamp(floor(global.settings.font_index), 0, array_length(global.panel_fonts) - 1);
    global.settings.percentage_played_needed = clamp(global.settings.percentage_played_needed, 0, 100) / 100;
}