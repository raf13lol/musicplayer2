function array_swap(array, position_1, position_2)
{
    var temp = array[position_1];
    array[position_1] = array[position_2];
    array[position_2] = temp;
}