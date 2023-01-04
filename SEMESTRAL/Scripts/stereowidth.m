clear; clc; close all;
[x, Fs] = audioread('ptv-mix.aif');

% mid-side conversion
mid = (x(:,1) + x(:,2))/2; % mid = (left + right)/2
side = (x(:,1) - x(:,2))/2; % side = (left - right)/2

% side gain
side_gain = 1.5; % gain of the side channel

% process side
side = side * side_gain; % apply gain (m)

% convert back to stereo
newleft = mid + side;
newright = mid - side;

y = [newleft, newright];

% old and new
oldandnew = [x; y];
% play audio
%soundsc(oldandnew, Fs);
% plot original and processed audio
goniometer(x, 1);
goniometer(y, 2);