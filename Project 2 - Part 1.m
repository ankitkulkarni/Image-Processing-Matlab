inputImage = imread('KulkarniGray.jpg');
histogramIpImg = imhist(inputImage);
figure;
subplot(1, 2, 1);
imshow(inputImage);
subplot(1, 2, 2);
bar(imhist(inputImage));