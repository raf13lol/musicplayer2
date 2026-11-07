function plays_create_month(year, month)
{
    var year_struct = plays_create_year(year);
    
    month = string(month);
    if (struct_exists(year_struct, month))
        return year_struct[$ month];
    
    var month_struct = {};
    year_struct[$ month] = month_struct;
    return month_struct;
}