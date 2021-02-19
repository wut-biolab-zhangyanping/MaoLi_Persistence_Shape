function [binary_mask] = getBinaryMask(img)
    gray = rgb2gray(img);
    mask = ~im2bw(gray, 0);
    binary_mask = mask;
end

