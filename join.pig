cities = load 'cities_small.txt' as (name:chararray, state:chararray, population:int);
states = load 'states.txt' as (rank:int, code:chararray, fullname:chararray,date_entered:chararray, year_entered:int);
cities_join_states = join cities by state, states by code;
store cities_join_states into 'cities_join_states';