event_inherited();

toggle_key = vk_nokey;
default_visible = false;
panel_id = "textbox";
panel_name = "textbox";

overlay = true;
textbox_init(

// Do nothing on update 
function(){}, 
function(text)
{
    keyboard_clear(vk_enter);
    if (string_trim(text) == "")
    {
        if (!is_undefined(on_cancel))
            on_cancel();
        hide();
        exit;
    }
    
    if (!is_undefined(on_try_submit))
    {
        var res = on_try_submit(text);
        if (!res[0]) 
        {
            message = res[1];
            return;
        }
    }
    
    if (!is_undefined(on_submit))
        on_submit(text);
    hide();
}
    
);

placeholder = "default placeholder";
message = "";

open = function(name, placeholder, on_submit_method, on_try_submit_method = undefined, on_cancel_method = undefined)
{
    keyboard_clear(vk_enter);
    
    textbox_text = "";
    textbox_text_index = 1;
    
    panel_name = name;
    
    self.placeholder = placeholder;
    message = "";
    
    on_cancel = on_cancel_method;
    on_submit = on_submit_method;
    on_try_submit = on_try_submit_method;
    
    show();
}

on_cancel = undefined;
on_submit = undefined;
on_try_submit = undefined;