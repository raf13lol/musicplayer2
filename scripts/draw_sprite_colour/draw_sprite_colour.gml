function draw_sprite_colour(sprite, subimg, x, y, colour)
{
    INLINE_FUNCTION;
    draw_sprite_ext(sprite, subimg, x, y, 1, 1, 0, colour, 1);
}