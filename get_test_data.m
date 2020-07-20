%% read picture
path = 'C:\Users\takumi\Documents\MATLAB\ECE407\final\test\'; 
file = dir(fullfile(path,'*.bmp')); % get all picture's info
fileNames = {file.name}'; % read name of pictures as n*1 vector
n = size(fileNames,1); 
test = zeros(100*100,n);
for k = 1 : n
    file_path = strcat(path, fileNames(k));
    % eval(['img',num2str(k),'=','imread(file_path{1,1})',';']);
    test(:,k)=reshape(imread(file_path{1,1}),100*100,1); % put all the images in a n*10000 matrix
end
%I = uint8(round(I));
%% label
test_label=fileNames;
%% save data
save('test.mat','test','test_label')