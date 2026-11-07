function file_text_write_all(filename, text)
{
    var buf = buffer_create(1, buffer_grow, 1);
    
    buffer_write(buf, buffer_string, text);
    buffer_save(buf, filename);
    
    buffer_delete(buf);
}