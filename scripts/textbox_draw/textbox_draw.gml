function textbox_draw(x, y, placeholder, increment_frame_counter = true)
{
    var has_text = textbox_text != "";
    draw_set_colour(has_text ? c_white : PLACEHOLDER_COLOUR);
    draw_text(x, y, has_text ? textbox_text : placeholder);
    draw_set_colour(c_white);
    
    if (textbox_frame_counter % 50 > 30)
        draw_text(x + string_width(string_copy(textbox_text, 1, textbox_text_index - 1)) - 3, y, "|");
    textbox_frame_counter += increment_frame_counter;
}