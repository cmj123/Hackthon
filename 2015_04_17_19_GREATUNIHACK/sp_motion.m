% Name: Esuabom Dijemeni
% Date: 18/04/2015:
% Purpose: Use average motion to detect sleep apnea


%% Convert image sequence to video

% Construct a VideoWriter object, 
% which creates a Motion-JPEG AVI file by default.
workingDir = 'C:\DISE_100';
outputVideo = VideoWriter(fullfile(workingDir,'sleep_apnea.avi'));
outputVideo.FrameRate = 25;
open(outputVideo)

%% Find all the JPEG file names in the images folder. 
% Convert the set of image names to a cell array.
imageNames = dir(fullfile(workingDir,'*.jpg'));
imageNames = {imageNames.name}';


%% Loop through the image sequence, 
% load each image, and then write it to the video.
for ii = 1:length(imageNames)
   img = imread(fullfile(workingDir,imageNames{ii}));
   writeVideo(outputVideo,img)
end

%% Finalize the video file.
close(outputVideo)