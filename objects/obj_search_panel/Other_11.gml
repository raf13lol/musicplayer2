///@desc Update search
if (search_term == previous_search_term)
    exit;

previous_search_term = search_term;
if (search_term != "")
{
    var previous_term = search_term;
    search_term = string_lower(search_term);
    
    search_results = array_filter(global.sf_relative_songs_found, function (e, i)
    {
        return string_pos(search_term, string_lower(e)) != 0;
    });
    
    search_term = previous_term;
}
else
    search_results = variable_clone(global.sf_relative_songs_found);
search_results_length = array_length(search_results);
vertical_selected = 0;