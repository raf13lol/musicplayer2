function draw_text_selected(x, y, text, selected)
{
    INLINE_FUNCTION;
    var colour = selected ? SELECTED_COLOUR : c_white;
    draw_text_colour(
        x, y, text, 
        colour, colour, colour, colour,
        1
    );
}