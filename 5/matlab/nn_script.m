path_to_data = 'd:\rdelutio\data\' % make sure to set your own path here

imdsTrain = imageDatastore(strcat(path_to_data, 'train'), 'IncludeSubfolders',true,'LabelSource','foldernames'); 
imdsValidation = imageDatastore(strcat(path_to_data, 'test'), 'IncludeSubfolders',true,'LabelSource','foldernames');

% Plotting 20 images of the MNIST training set
figure;
perm = randperm(10000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(imdsTrain.Files{perm(i)});
end
img = readimage(imdsTrain,1);
size(img)

% Base model
layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(5,3,'Padding','same')
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,5,'Padding','same')
    reluLayer
    
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

% Training options
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.005, ...
    'MaxEpochs',10, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

    
% Training    
net = trainNetwork(imdsTrain,layers,options);

% Evaluation
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation)