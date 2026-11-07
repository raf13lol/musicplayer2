var panel_count = instance_number(obj_panel);
var panels = array_create(panel_count);

for (var i = 0; i < panel_count; i++)
    panels[i] = instance_find(obj_panel, i);

array_sort(panels, function(current_panel, next_panel)
{
    var cur = (current_panel.y + current_panel.x * room_height);
    var next = (next_panel.y + next_panel.x * room_height);
    
    if (current_panel.overlay)
        cur += room_width * room_height;
    if (next_panel.overlay)
        next += room_width * room_height;
    
    return cur - next;
});

for (var i = 0; i < panel_count; i++)
    panels[i].panel_index = i;