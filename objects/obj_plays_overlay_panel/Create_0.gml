event_inherited();

default_visible = false;
panel_id = "plays";
panel_name = "plays";

overlay = true;

list_type = plays_list_type.month;
month_selected = current_month;
year_selected = current_year;
vertical_selected = 0;

plays = [];
plays_length = 0;
total_plays = 0;
event_user(1); // update plays

plays_height = ((height - 3 * 16 - 4) div 32); // -1 for list_type, -1 for time period, -1 to display total plays at the bottom