cities = load 'cities_small.txt' as (name:chararray, state:chararray, population:int);

states = load 'states.txt' as (rank:int, code:chararray, fullname:chararray,date_entered:chararray, year_entered:int);

cities_join_states = join cities by state, states by code;
-- # our joined dataset will have 7 columns
-- # Las Vegas  NV	     558383    36	NV	Nevada	31-OCT	1864
-- # to clean it up use foreach generate

cities_join_states_short = foreach cities_join_states generate cities::name, states::fullname;

store cities_join_states_short into 'cities_join_states_short';


-- # note that the join followed by the generate
-- # can be written in a single statement
-- # cities_join_states_short = FOREACH (join cities by state, states by code) GENERATE cities::name,states::fullname;