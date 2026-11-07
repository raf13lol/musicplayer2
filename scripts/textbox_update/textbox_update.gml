function textbox_update(textbox_editable = true)
{
    if ((textbox_last_update + 1) < global.frame_count)
        keyboard_string = "";
    textbox_last_update = global.frame_count;
    
    var keyboard_str = keyboard_string;
    var control_pressed = keyboard_check(vk_control);
    
    keyboard_string = "";
    var textbox_index_dir = ia_get_horizontal_dir();
    if (textbox_index_dir != 0)
    {
        var dir_to_check = textbox_index_dir * (textbox_index_dir < 0);
        while (true)
        {
            textbox_text_index += textbox_index_dir;    
            
            var before_clamp = textbox_text_index;
            textbox_text_index = clamp(textbox_text_index, 1, string_length(textbox_text) + 1);
            
            if (!control_pressed 
                || before_clamp != textbox_text_index 
                || string_char_at(textbox_text, textbox_text_index + dir_to_check) == " ")
                break;
        }
    }
    
    if (keyboard_check_pressed(vk_enter))
    {
        textbox_on_enter(textbox_text, control_pressed);
    }
    else if (ia_check_pressed(vk_backspace) || ia_check_pressed(vk_delete))
    {
        if (!textbox_editable)
            exit;
        
        while (textbox_text_index > 1)
        {
            textbox_text = string_delete(textbox_text, --textbox_text_index, 1);
                  
            if (!control_pressed || string_char_at(textbox_text, textbox_text_index - 1) == " ")
                break;
        }
        
        textbox_on_update(textbox_text, control_pressed);
    }
    else if (textbox_editable && keyboard_check_pressed(vk_anykey))
    {
        if (control_pressed)
        {
            if (keyboard_check_pressed(ord("C")))
                clipboard_set_text(textbox_text);
            else if (keyboard_check_pressed(ord("V")) && clipboard_has_text())
            {
                var clipboard = clipboard_get_text();
                textbox_text = string_insert(clipboard, textbox_text, textbox_text_index);
                textbox_text_index += string_length(clipboard);
            }
            else if (keyboard_check_pressed(ord("X")))
            {
                clipboard_set_text(textbox_text);
                textbox_text = "";
                textbox_text_index = 1;
            }
        }
        else  
        {
            if (keyboard_check_pressed(vk_escape))
                return;
            
            var len = string_length(keyboard_str);
            var code = string_ord_at(keyboard_str, len);
            var char = string_char_at(keyboard_str, len);
            if (code < 0x20 || char == "")
                return;
            
            textbox_text = string_insert(char, textbox_text, textbox_text_index);
            textbox_text_index++; 
        }
        
        textbox_on_update(textbox_text, control_pressed);
    }
}