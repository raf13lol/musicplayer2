function draw_text_colour_simple(x, y, text, colour)
{
    INLINE_FUNCTION;
    draw_text_colour(
        x, y, text, 
        colour, colour, colour, colour,
        1
    );
}