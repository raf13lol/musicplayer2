///@desc Update queue order with index following sound pointed to
if (array_length(current_queue_order) == 0)
    exit;
    
var do_shuffle = shuffle_mode != shuffle_type.none;
var index = current_queue_order[current_queue_index];
if (do_shuffle)
    queue_order_start = index;
else if (shuffle_perserve_index)
    current_queue_index = index;  

event_user(4); // create queue order
if (do_shuffle && shuffle_perserve_index)
    current_queue_index = 0;

shuffle_perserve_index = true;