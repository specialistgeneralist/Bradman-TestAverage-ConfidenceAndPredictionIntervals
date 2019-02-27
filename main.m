% Simple MATLAB script to explore the confidence interval vs.
%   prediction interval for Don Bradman's test batting career.
%   data: http://stats.espncricinfo.com/guru?tourneyid=0;captain=0;conclow=;scheduledovers=0;wicketslow=;scheduleddays=0;sdb=player;homeaway=0;ballslow=;toss=0;submit=1;groundid=0;recent=;overslow=;enddefault=1948-08-18;followon=0;notcountry=0;batposition=0;caughthigh=;runslow=;caughtlow=;dismissalshigh=;team=0;stumpedhigh=;daynight=0;continent=0;keeper=0;runshigh=;season=0;class=testplayer;dnp=0;result=0;stumpedlow=;playerid=492;dismissalslow=;finals=0;dismissal=0;viewtype=bat_list;end=1948-08-18;notopposition=0;ballshigh=;caughttype=0;conchigh=;overshigh=;seriesresult=0;startdefault=1928-11-30;country=0;opposition=0;start=1928-11-30;csearch=;bpof=0;innings=0;bowposition=0;wicketshigh=;filter=basic;.cgifields=viewtype

% Simon D. Angus, Dept. of Economics, Monash University, Feb 2019
% simon.angus@monash.edu

% PARAMS
FNAME = 'bradman.csv';
ALPHA = 0.05;			% 0.05 will produce 95% intervals

% .. ingest
db = readtable(FNAME);
db.not_out = contains(db.not_out,'1');		% fix string
n_all = height(db);
n = n_all - sum(db.not_out);				% NB: we adjust 'n' down by the number of not-out innings - a peculiarity of Cricket
x_bar = sum(db.runs) / n;
x = db.runs;


% .. get s and t-stat
s_y = sqrt((sum(x-x_bar).^2)./(n-2));
t = tinv(1-ALPHA/2,n-2);

% .. confidence interval (variation around the mean)
y_high = x_bar  + t * s_y * sqrt(1/n);
y_low  = x_bar  - t * s_y * sqrt(1/n);

% .. prediction interval (variation expected for a point prediction)
yp_high = x_bar  + t * s_y * sqrt(1 + 1/n);
yp_low  = x_bar  - t * s_y * sqrt(1 + 1/n);

% .. output
fprintf('\nBRADMAN Test Analysis (alpha=%.3f) ...\n', ALPHA)
fprintf(' --> total runs: %.0f\n', sum(x))
fprintf(' --> n* (all innings): %.0f\n', n_all)
fprintf(' --> n (minus %.0f not-outs): %.0f\n', sum(db.not_out), n)
fprintf(' --> average with ConfInt: %.1f, (%.1f to %.1f)\n', sum(x)/n, y_low, y_high)
fprintf(' --> prediction interval: %.1f to %.1f\n\n', yp_low, yp_high)
