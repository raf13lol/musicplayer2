///@desc Toggle pause sound
if (current_sound == noone || current_channel == noone)
    exit;

paused = !paused;
fmod_channel_control_set_paused(current_channel, paused);