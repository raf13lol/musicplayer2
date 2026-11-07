///@desc Play current sound from queue
if (current_queue_index < 0 || current_queue_index >= array_length(current_queue))
    exit;

var queue_index = current_queue_index;
if (queue_index < array_length(current_queue_order))
    queue_index = current_queue_order[current_queue_index];

if (current_channel != noone)
    fmod_channel_control_stop(current_channel);

var sound_path = current_queue[queue_index];
if (sound_path != current_sound_path)
{
    if (current_sound != noone)
        fmod_sound_release(current_sound);
    
    var extra = new FmodSystemCreateSoundExInfo();
    
    var sound_folder = filename_path(sound_path);
    var dls_paths = [
        sound_folder + filename_name_without_ext(sound_path),
        sound_folder + "bank",
        working_directory + "bank",
    ];
    
    var len = array_length(dls_paths);
    for (var i = 0; i < len; i++)
    {
        var dls_path = dls_paths[i] + ".dls";
        if (!file_exists(dls_path))
            continue;
            
        extra.dls_name = dls_path;
        break;
    }
    
    current_sound = fmod_system_create_sound(
        sound_path, 
        FMOD_MODE.ACCURATETIME |
        FMOD_MODE.CREATESTREAM |
        FMOD_MODE.IGNORETAGS |
        FMOD_MODE.LOWMEM |
        FMOD_MODE.UNIQUE |
        FMOD_MODE.MPEGSEARCH,
        extra
    );
    current_sound_length = fmod_sound_get_length(current_sound, FMOD_TIMEUNIT.MS);
    current_sound_path = sound_path;
    
    with (obj_discord_presence)
        event_user(0); // update presence

    var relative_path = filename_handle_relative_path(current_sound_path, global.sf_combined_directories);
    
    ini_open(SONGS_INI_FILE)
    
    volume = ini_read_real(relative_path, "volume", saved_volume);
    pitch = ini_read_real(relative_path, "pitch", saved_pitch);
    
    ini_close();
}

current_channel = fmod_system_play_sound(current_sound, false);
fmod_channel_control_set_callback(current_channel);

event_user(1); // update sound props
event_user(10); // reset playback vars