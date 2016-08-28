%% Specify the directory containing the .pgm files in dirname variable
%% Saves the images in a uint8 array called 'data'.

clear;
% Path of the data
%dirname = 'ming-hsuan_light/';
dirname = '/usr/data/Datasets/VOT/ball/';
% Sort the image files with the specified extention
%filenames = dir([dirname '*.pgm']);
filenames = dir([dirname '*.jpg']);
filenames = sort({filenames.name});

% read the first to see how large it should be
im = imread([dirname filenames{1}]);
data = repmat(uint8(0),[size(im,1) size(im,2) length(filenames)]);
if size(im,3) == 1
    for ii = 1:length(filenames)
        data(:,:,ii) = imread([dirname filenames{ii}]);
    end
else
    for ii = 1:length(filenames)
        % if color, convert to grayscale
        data(:,:,ii) = rgb2gray(imread([dirname filenames{ii}]));
    end
end
