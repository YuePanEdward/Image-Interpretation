function [ img, gt ] = load_graz( scale )
% LOAD_GRAZ load graz dataset
% first output: color image
% second output: ground truth
% 1 == street
% 2 == building
% 3 == vegetation

img = im2double(imread('graz_5.tif'));
gt  = imread('gt_graz_5.tif');
gt(gt==4) = 3; % combine vegetation classes
if nargin == 1
img=imresize(img,scale);
gt =imresize(gt,scale,'nearest');
end

