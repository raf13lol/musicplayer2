///@desc Update sound props
if (current_sound == noone || current_channel == noone)
    exit;

fmod_channel_control_set_pitch(current_channel, pitch);
fmod_channel_control_set_volume(current_channel, volume);