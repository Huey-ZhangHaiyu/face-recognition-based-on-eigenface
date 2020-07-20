%% read picture
path = 'C:\Users\takumi\Documents\MATLAB\ECE407\final\data\'; 
file = dir(fullfile(path,'*.bmp')); % get all picture's info
fileNames = {file.name}'; % read name of pictures as n*1 vector
n = size(fileNames,1); 
train = zeros(100*100,n);
for k = 1 : n
    file_path = strcat(path, fileNames(k));
    train(:,k)=reshape(imread(file_path{1,1}),100*100,1); % put all the images in a n*10000 matrix
end
%% label
train_label=fileNames;
%% save data
save('train.mat','train','train_label')