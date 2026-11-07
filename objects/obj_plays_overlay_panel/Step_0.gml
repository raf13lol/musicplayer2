event_inherited();
if (!is_focused())
    exit;

var horizontal_dir = ia_get_horizontal_dir();
vertical_selection_update(plays_length + 2, plays_height);

if (vertical_selected >= 2 || horizontal_dir == 0)
    exit;

if (vertical_selected == 0)
{
    list_type = wrap_value(list_type + horizontal_dir, 0, plays_list_type.__max - 1);
    event_user(1); // update plays
    exit;
}

switch (list_type)
{
    case plays_list_type.month:
        month_selected += horizontal_dir;
        
        if (month_selected < 1)
            year_selected--;
        else if (month_selected > 12)
            year_selected++;
        
        month_selected = wrap_value(month_selected, 1, 12);
        break;    
    
    case plays_list_type.year:
        year_selected += horizontal_dir;
        break;    
    
    case plays_list_type.all_time:
        exit; // time period doesn't change
}

event_user(1); // update plays