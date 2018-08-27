cities = load 'cities_small.txt' as (name:chararray, state:chararray, population:int);
ordered_cities = order cities by population desc;
top5_ordered_cities = limit ordered_cities 5;
dump top5_ordered_cities;