///@desc Create queue order
var queue_length = array_length(current_queue);
var queue_order = array_create_ext(queue_length, function(i)
{
    return i;
});

var do_shuffle = shuffle_mode != shuffle_type.none;
if (do_shuffle)
    current_queue_order = array_shuffle(queue_order);
else
    current_queue_order = queue_order;

if (do_shuffle && queue_order_start != noone)
{
    var index_of_start = array_get_index(current_queue_order, queue_order_start);
    if (index_of_start == -1)
        exit;
    
    array_swap(current_queue_order, 0, index_of_start);
    queue_order_start = noone;
}