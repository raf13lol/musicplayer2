function settings_string_to_presence_detail_level(detail_level)
{
    var pdl = string_trim(detail_level);
    pdl = string_lower(pdl);
    pdl = string_replace_all(pdl, " ", "");
    pdl = string_replace_all(pdl, "_", "");
    switch (pdl) 
    {
        case "none": case "off": case "disable": case "disabled": return presence_detail_level.none;
        case "open": case "min": case "minimal": return presence_detail_level.open;
        case "playing": case "on": case "enable": case "enabled": return presence_detail_level.playing;
        case "playingwithrelative": case "playingrelative": case "mostinfo": case "mostinformation": 
        case "max": case "pwr": return presence_detail_level.playing_with_relative;
            
    	default: return presence_detail_level.playing;
    }
}

