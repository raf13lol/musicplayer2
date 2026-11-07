current_sound = noone;
current_sound_path = "";
current_channel = noone;

current_sound_length = 0;
current_sound_played = 0;
current_sound_added_play = false;

current_queue = [];
current_queue_order = [];
current_queue_index = 0;

next_play_mode = next_play_type.next;
loop_mode = loop_type.queue;

shuffle_mode = shuffle_type.none;
shuffle_perserve_index = true;
queue_order_start = noone;

ini_open(SONGS_INI_FILE);

volume = ini_read_real("", "volume", 1);
pitch = ini_read_real("", "pitch", 1);

ini_close();

saved_volume = volume;
saved_pitch = pitch;

paused = false;
ab_start_pos = noone;
ab_end_pos = noone;

get_position = function()
{
    if (current_channel == noone)
        return 0;
    return fmod_channel_get_position(current_channel, FMOD_TIMEUNIT.MS);
}
set_position = function(milliseconds)
{
    if (current_channel == noone)
        return;
    
    if (milliseconds == 0)
    {
        current_sound_played = 0;
        current_sound_added_play = false;
    }
    fmod_channel_set_position(current_channel, milliseconds, FMOD_TIMEUNIT.MS);
}

remove_track_from_queue = function(sound_index, create_queue_order = true)
{
    var current_sound_was_removed = current_queue_index == sound_index;
    if (current_sound_was_removed)
    {
        event_user(2); // stop sound
        current_queue_index = 0;
    }
    
    var start = current_queue_order[current_queue_index];
    var deleted_order_index = current_queue_order[sound_index];
    
    array_delete(current_queue, deleted_order_index, 1);
    array_delete(current_queue_order, sound_index, 1);
    
    if (current_queue_index > sound_index)
        current_queue_index--;
    if (start > deleted_order_index)
        start--;
    
    if (!create_queue_order)
    {
        var len = array_length(current_queue_order);
        for (var i = 0; i < len; i++)
        {
            if (current_queue_order[i] >= deleted_order_index)
                current_queue_order[i]--;
        }
        return current_sound_was_removed;
    }
    
    if (shuffle_mode != shuffle_type.none && !current_sound_was_removed)
        queue_order_start = start;
    event_user(4); // create queue order
    
    return current_sound_was_removed;
}

alt_play_pause_key = global.settings.keybinds.alt_media.play_pause;
alt_stop_key = global.settings.keybinds.alt_media.stop;
alt_previous_track_key = global.settings.keybinds.alt_media.previous_track;
alt_next_track_key = global.settings.keybinds.alt_media.next_track;