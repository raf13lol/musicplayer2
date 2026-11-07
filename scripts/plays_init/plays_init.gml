function plays_init()
{
    global.plays = {};
    
    if (file_exists(PLAYS_JSON_FILE))
        global.plays = json_parse(file_text_read_all(PLAYS_JSON_FILE));
    else
        plays_save();
}