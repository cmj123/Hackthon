%Name : Esuabom David Dijemeni
%Date: 18/04/2105
%Purpose: Learb motion estimation sing BlockMatcher

 %% Create objects
htran = vision.GeometricTranslator('Offset', [5 5], 'OutputSize', 'Same as input image');
hbm = vision.BlockMatcher('ReferenceFrameSource', 'Input port', 'BlockSize', [35 35]);
hbm.OutputValue = 'Horizontal and vertical components in complex form';
halphablend = vision.AlphaBlender;

%%


for i = 1:99
    ii = i +1;
    s1 = 'C:\DISE_C_100\Camera_Data 0';
    s2 = sprintf('%03d',i);
    s4 = sprintf('%03d',ii);    
    s3 = '.jpg'
    s_img1 = strcat(s1,s2,s3)
    s_img2 = strcat(s1,s4,s3)

    % Read and Convert RGB image tp grayscale
    img1 = im2double(rgb2gray(imread(s_img1)));

    % Offset the first image by [5 5] pixelsto create second image
    %img2 = step(htran, img1);
    img2 = im2double(rgb2gray(imread(s_img2)));

    % Compute motion for the two images
    motion = step(hbm, img1, img2);
    motion_mag = abs(motion);
    motion_mag_avg(i) = sum(motion_mag(:));
    motion_phase = angle(motion);
    motion_phase_avg(i) = sum(motion_phase(:));

    % Blend two images
    img12 = step(halphablend, img2, img1);

    % Use quiver plot to show the direction of motion on the images
    
    [X Y] = meshgrid(1:35:size(img1, 2), 1:35:size(img1, 1));
    figure(2); imshow(img12); hold on;
    quiver(X(:), Y(:), real(motion(:)), imag(motion(:)), 0)
    hold off;
end
    