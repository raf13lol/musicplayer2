///@desc Previous track button

if (get_position() < 10_000)
{
    current_queue_index = max(current_queue_index - 1, 0);
    event_user(0); // play sound
    exit;
}
set_position(0);