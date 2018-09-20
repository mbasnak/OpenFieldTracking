%% Script to analyze Ctrax output

close all;clear all
%% Fix the errors
% The first thing to do is to fix the potential errors in the tracking
% output and then save the corrected data to a new file

% fixerrors

%% Load the correct data

%ask user input to open a file and load it.
[FileName,PathName] = uigetfile('.mat')
load(FileName) 

z = zeros(size(trx.x));
col = trx.timestamps; %create a color vector specified by the timestamps

%% Plot the fly's trajectory

figure,
surface([trx.x;trx.x],[trx.y;trx.y],[z;z],[col;col],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',2);
title('Trajectory of the fly');
xlabel('x coordinates (px)'); ylabel('y coordinates (px)');


%% Display per frame statistics

%compute_perframe_stats

[FileName,PathName] = uigetfile('.mat')
load(FileName) 

% plot the distance and angle to the closest wall when in a circular arena
figure,
subplot(1,2,1)
plot(trx.dist2wall,'k')
title('Distance from mass center to arena wall');
ylabel('Distance (mm)'); xlabel('Time');
subplot(1,2,2)
plot(trx.theta2wall,'r')
title('Angle to closest point in arena wall');
ylabel('Angle (rad)'); xlabel('Time');

