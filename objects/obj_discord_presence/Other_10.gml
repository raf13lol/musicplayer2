 //@desc update presence
if (!ready)
    exit;

if (detail_level == presence_detail_level.none)
{
    instance_destroy();
    np_clearpresence();
    exit;
}

var frame = use_frame_2 ? "frame2" : "frame1";
use_frame_2 = !use_frame_2;

var playing = obj_song_player.current_sound != noone;

var details = playing ? filename_name_without_ext(obj_song_player.current_sound_path) : "not listening to anything";
var state = "";
if (playing)
{
    if (detail_level == presence_detail_level.open)
        details = "playing";
    else if (detail_level == presence_detail_level.playing_with_relative)
        state = filename_handle_relative_path(obj_song_player.current_sound_path, global.sf_combined_directories);
}   

np_setpresence(state, details, frame, "");