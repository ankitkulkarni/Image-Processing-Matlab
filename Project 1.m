inputImage = imread('KulkarniGray.jpg');
[height, width] = size(inputImage);
dynamicRange = 256;
inputImage = double(inputImage);
Quant = zeros(256, 1);
levels = 4;
while levels < 64
    levels = levels * 2;
    quantInterval = dynamicRange / levels;
    for i = 0:255,
        Quant(i + 1, 1) = floor(i / quantInterval) * quantInterval + quantInterval / 2;
    end
    temp = zeros(size(inputImage));
    for i = 1:height,
        for j = 1:width,
            temp(i, j) = Quant(inputImage(i, j) + 1);
        end
    end
    MeanSquaredError = mean(mean((inputImage - temp).^2));
    PeakSignalToNoiseRatio = 10 * log10(255 ^ 2 / MeanSquaredError);
    temp = uint8(temp);
    figure;
    imshow(temp);
    title(sprintf('Levels = %f, Mean Squared Error = %f, Peak Signal to Noise Ratio = %f', levels, MeanSquaredError, PeakSignalToNoiseRatio));
end