if (async_load[? "type"] != "fmod_channel_control_set_callback")
    exit;
if (async_load[? "kind"] != FMOD_CHANNELCONTROL_CALLBACK_TYPE.END)
    exit;
if (async_load[? "channel_ref"] != current_channel)
    exit;
event_user(7); // sound ended