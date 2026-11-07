///@desc Sound ended
if (next_play_mode == next_play_type.stop)
{
    event_user(8); // clear queue
    exit;
}

if (loop_mode == loop_type.single)
    event_user(0); // play current sound 
else
    event_user(5); // play next track

if (next_play_mode == next_play_type.next_paused)
    event_user(3); // paused