B1 = (rgb2gray(I));
B2 = B1 < 60;
figure(1); 
subplot(1,3,1); imshow(I)
subplot(1,3,2); imshow(B2)


[B,L] = bwboundaries(B2);
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end