///@desc Update plays listing

var months_to_scan;
switch (list_type)
{
    default:
    case plays_list_type.month:
        months_to_scan = [plays_create_month(year_selected, month_selected)];
        break;
    
    case plays_list_type.year:
        months_to_scan = array_create(12);
        for (var i = 1; i <= 12; i++)
            months_to_scan[i - 1] = plays_create_month(year_selected, i);
        break;
    
    case plays_list_type.all_time:
        months_to_scan = [];
        
        var years = struct_get_names(global.plays);
        var year_count = struct_names_count(global.plays);
        for (var i = 0; i < year_count; i++)
        {
            var year = years[i];
            for (var j = 1; j <= 12; j++)
                array_push(months_to_scan, plays_create_month(year, j));
        }
        break;
}

total_plays = 0;

var overall_plays = {};
var month_count = array_length(months_to_scan);
for (var i = 0; i < month_count; i++)
{
    var month = months_to_scan[i];
    
    var songs = struct_get_names(month);
    var song_count = struct_names_count(month);
    for (var j = 0; j < song_count; j++)
    {
        var song = songs[j];
        var hash = variable_get_hash(song);
        
        var month_play_count = struct_get_from_hash(month, hash);
        total_plays += month_play_count;
        
        var play_count = 0;
        if (struct_exists_from_hash(overall_plays, hash))
            play_count = struct_get_from_hash(overall_plays, hash);
        
        struct_set_from_hash(overall_plays, hash, play_count + month_play_count);
    }
}

var songs = struct_get_names(overall_plays);

plays_length = struct_names_count(overall_plays);
plays = array_create(plays_length);

for (var i = 0; i < plays_length; i++)
{
    var song = songs[i];
    var play_count = overall_plays[$ song];
    var play_percentage = play_count / total_plays;
    
    plays[i] = {song, play_count, play_percentage};
}

array_sort(plays, function(left, right)
{
    var diff = sign(right.play_count - left.play_count);
    if (diff != 0)
        return diff;
    
    return array_sort_strings_case_insensitive(left.song, right.song);
});