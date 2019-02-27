Don Bradman's Test Batting Average: Confidence Intervals and Prediction Intervals
=================================================================================
*Simon D. Angus, Dept. of Economics, Monash University (Feb 2019)*

To accompany the online article entitled, *How long before we break the two-hour barrier in the men’s marathon?* published on 27 Feb 2019 at: https://theconversation.com/how-long-before-we-break-the-two-hour-barrier-in-the-mens-marathon-112505

Which accompanies a scientific report by the author, *A statistical timetable for the sub-2 hour marathon*, published in _Medicine & Science of Sport and Exercise_ and is available, under open-access, from the publisher's website.

## Running the code
We assume **MATLAB** is installed, with the *Statistics* toolbox (to get the inverse t-distribution). However, the code is very transparent and could be implemented easily in any mathematical or statistical software.

To run:
```
>> main

BRADMAN Test Analysis (alpha=0.050) ...
 --> total runs: 6996
 --> n* (all innings): 80
 --> n (minus 10 not-outs): 70
 --> average with ConfInt: 99.9, (71.0 to 128.8)
 --> prediction interval: -143.6 to 343.5
```

Note: since batting innings are bounded below at 0 (a 'duck'), the lower prediction interval can reported as 0. An extension of the approach would be to calculate _non-symmetric_ intervals, which would likely respect the lower bound.
