function file_text_read_all(filename)
{
    var buf = buffer_load(filename);
    var res = buffer_read(buf, buffer_text);
    
    buffer_delete(buf);
    return res;
}