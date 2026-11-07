function plays_save()
{ 
    INLINE_FUNCTION;
    file_text_write_all(PLAYS_JSON_FILE, json_stringify(global.plays, true));
}