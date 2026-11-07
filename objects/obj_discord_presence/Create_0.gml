ready = false;
detail_level = global.settings.presence_level;
use_frame_2 = false;
if (detail_level == presence_detail_level.none)
{
    instance_destroy();
    exit;
}

np_initdiscord(DISCORD_APP_ID, false, np_steam_app_id_empty);