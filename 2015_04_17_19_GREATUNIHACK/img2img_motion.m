%Name : Esuabom David Dijemeni
%Date: 18/04/2105
%Purpose: Learb motion estimation sing BlockMatcher
i = 10;
s1 = 'C:\DISE_100\DISE_FURTHER_VIDEO_IMAGES 000';
s2 = int2str(i);
s3 = '.jpg'
s = strcat(s1,s2,s3)

%% Read and Convert RGB image tp grayscale
img1 = im2double(rgb2gray(imread('C:\DISE_100\DISE_FURTHER_VIDEO_IMAGES 00041.jpg')));

%% Create objects
htran = vision.GeometricTranslator('Offset', [5 5], 'OutputSize', 'Same as input image');
hbm = vision.BlockMatcher('ReferenceFrameSource', 'Input port', 'BlockSize', [35 35]);
hbm.OutputValue = 'Horizontal and vertical components in complex form';
halphablend = vision.AlphaBlender;

%% Offset the first image by [5 5] pixelsto create second image
%img2 = step(htran, img1);
img2 = im2double(rgb2gray(imread('C:\DISE_100\DISE_FURTHER_VIDEO_IMAGES 00042.jpg')));

%% Compute motion for the two images
motion = step(hbm, img1, img2);
motion_mag = abs(motion);
motion_phase = angle(motion);

%% Blend two images
img12 = step(halphablend, img2, img1);

%% Use quiver plot to show the direction of motion on the images

[X Y] = meshgrid(1:35:size(img1, 2), 1:35:size(img1, 1));
imshow(img12); hold on;
quiver(X(:), Y(:), real(motion(:)), imag(motion(:)), 0)