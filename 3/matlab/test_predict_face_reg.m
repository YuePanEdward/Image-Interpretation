% Get list of all PGM files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
folder = 'materials/small_dataset/';
imagefiles = dir(fullfile(folder, '*.jpg'));      
nfiles = length(imagefiles); % Number of files found

% create set of all images
for i=1:nfiles
   images(:, :, i) = double(imread(fullfile(folder, imagefiles(i).name)));
end

% get the shape of the data
[lgth, wdth, num_images] = size(images(:, :, :));
% shuffle the data
images = images(:, :, randperm(num_images));

% define size of train dataset
train_ratio = 0.8;
train_size = int32(train_ratio*num_images);
test_size = num_images - train_size; % deduce test dataset size
X_train = images(:, :, 1:train_size);
X_test = images(:, :, train_size+1:num_images);

% prepare the query
query = X_test(:, 1:int32(wdth/2), :);
right_parts = X_test(:, int32(wdth/2):wdth, :); % cook ground truth

prediction = ii_predict_face_reg(X_train, query, 1e-1); % make a prediction

predicted_full = cat(2, query, prediction); % concatenate query with preditction

ground_truth = cat(2, query, right_parts); % concatenate query with ground truth

% select test image number
i = randi(test_size);

% plots
figure(1)
subplot_tight(2,2,1,[0.05,0.05])
imshow(ground_truth(:, :, i), [])
title Original
subplot_tight(2,2,2,[0.05,0.05])
imshow(int32(predicted_full(:, :, i)), [])
title 'Regression result'
subplot_tight(2,2,3,[0.05,0.05])
imshow(ground_truth(:, :, i + 1), [])
title Original
subplot_tight(2,2,4,[0.05,0.05])
imshow(int32(predicted_full(:, :, i + 1)), [])
title 'Regression result'
truesize
