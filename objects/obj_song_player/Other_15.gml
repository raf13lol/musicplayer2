///@desc Next track with queue loop handling
var length = array_length(current_queue);
if (length == 0)
    exit;

if (current_sound == noone)
{
    event_user(0); // play sound
    exit;
}

current_queue_index++;
if (current_queue_index >= length)
{
    current_queue_index %= array_length(current_queue);
    
    // queue loop
    if (loop_mode == loop_type.none)
    {
        event_user(2); // stop sound
        exit;
    }
    else if (shuffle_mode == shuffle_type.reshuffle) 
        event_user(4); // shuffle
}

event_user(0); // play track