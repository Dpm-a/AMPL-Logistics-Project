# model
param To;
param From;

set to_area:= 1..To;
set from_area:= 1..From;

param tot_pop {from_area};
param coverage {from_area, to_area};

var Open {from_area} binary;

maximize pop_cov: sum {i in from_area} tot_pop[i]*Open[i];

subject to cover_const {j in to_area}: sum {i in from_area} coverage[i,j]*Open[i] >= 1;
subject to tot_facilities: sum {i in from_area} Open[i] = 1;