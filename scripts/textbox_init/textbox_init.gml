function textbox_init(on_update_func, on_enter_func)
{
    textbox_on_update = method(self, on_update_func);
    textbox_on_enter = method(self, on_enter_func);
    
    textbox_text = "";
    textbox_text_index = 1;
    textbox_last_update = -1;
    textbox_frame_counter = 0;
}