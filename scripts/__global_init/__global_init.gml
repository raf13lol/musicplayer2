//@returns {type} description
function __global_init()
{
    gml_pragma("global", "__global_init()");
    global.frame_count = 0;
    
    song_finder_run();
    playlist_init();
    
    ia_init();
    
    global.panel_fonts = [fnt_freemono, fnt_consolas, fnt_dejavusansmono];
    
    settings_init();
    plays_init();
    
    draw_set_font(global.panel_fonts[global.settings.font_index]);
    global.panel_overlay_open = false;
    global.panel_disable_switch = false;
    
    randomise();
    
    //draw_set_circle_precision(32);
}