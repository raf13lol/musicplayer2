///@desc Stop sound
if (current_channel != noone)
    fmod_channel_control_stop(current_channel);

if (current_sound != noone)
    fmod_sound_release(current_sound);

current_sound = noone;
current_sound_length = 0;
current_sound_path = noone;
current_channel = noone;

event_user(10); // reset playback vars

with (obj_discord_presence)
    event_user(0); // update presence