%% Script to analyze Ctrax output
%%

close all;clear all

% Load the .mat file that is the output of the tracking
[trx,~,~] = load_tracks('C:\Users\Melanie\Documents\Mel\Data\Tactile guidance\delrinchamber-wingclippedonlyfly-20180918-III_2018-09-18-124438-0000.mat',[])

allDataX = [trx(1).x,trx(2).x,trx(3).x,trx(4).x,trx(5).x,trx(6).x,trx(7).x];
allDataY = [trx(1).y,trx(2).y,trx(3).y,trx(4).y,trx(5).y,trx(6).y,trx(7).x];


% The struct trx will have as many rows as flies are detected by CTrax, so
% we should select the row corresponding to the fly of our interest
z = zeros(size(trx(6).x));
%col = trx(1).x;  
col = linspace(1,size(trx(6).x,2),size(trx(6).x,2)); % We define a vector for the color of the same length as the data
% I want to make the color vary with the time, but am not sure that this is
% the way

% Plot the fly's trajectory
figure,
surface([trx(6).x;trx(6).x],[trx(6).y;trx(6).y],[z;z],[col;col],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',2);
title('Trajectory of the fly');
xlabel('x coordinates (px)'); ylabel('y coordinates (px)');


%putting together all the data interpreted as different flies
allcol = linspace(1,size(allDataX,2),size(allDataX,2)); % We define a vector for the color of the same length as the data
allz = zeros(size(allDataX));

figure,
surface([allDataX;allDataX],[allDataY;allDataY],[allz;allz],[allcol;allcol],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',2);
title('Trajectory of the fly');
xlabel('x coordinates (px)'); ylabel('y coordinates (px)');



showtrx

simple_diagnostics


%% You can compute some per frame statistics that will be save to the trx file.
% some that we are interested in are the distance to the wall and the angle
% to the closest point in the wall.

compute_perframe_stats

% plot the distance and angle to the closest wall when in a circular arena
figure,
subplot(1,2,1)
plot(trx(1).dist2wall,'k')
title('Distance from mass center to arena wall');
ylabel('Distance (mm)'); xlabel('Time');
subplot(1,2,2)
plot(trx(1).theta2wall,'r')
title('Angle to closest point in arena wall');
ylabel('Angle (rad)'); xlabel('Time');

allDist = [trx(1).dist2wall,trx(2).dist2wall,trx(3).dist2wall,trx(4).dist2wall,trx(5).dist2wall,trx(6).dist2wall,trx(7).dist2wall];
allTheta = [trx(1).theta2wall,trx(2).theta2wall,trx(3).theta2wall,trx(4).theta2wall,trx(5).theta2wall,trx(6).theta2wall,trx(7).theta2wall];

figure,
subplot(1,2,1)
plot(allDist,'k')
title('Distance from mass center to arena wall');
ylabel('Distance (mm)'); xlabel('Time');
subplot(1,2,2)
plot(allTheta,'r')
title('Angle to closest point in arena wall');
ylabel('Angle (rad)'); xlabel('Time');



%use "histogramproperties" to plot nice histograms with these individual
%variables
