function plays_create_year(year)
{
    year = string(year);
    if (struct_exists(global.plays, year))
        return global.plays[$ year];
    
    var year_struct = {};
    global.plays[$ year] = year_struct;
    return year_struct;
}