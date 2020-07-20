%% load data
load('train.mat');
load('test.mat');
%% PCA
[r,c] = size(train);
mean_face = mean(train,2);
mu=zeros(r,c);
for i = 1 : c
    mu(:,i) = train(:,i)-mean_face;
end
covMat2 = mu'* mu/c;
[U,D]=eig(covMat2);
%% threshold
V=[];
for i = 1 : size(U,2) 
    if( D(i,i)>1e4 ) % Set Threshold
        V = [V U(:,i)];
    end
end
eigenfaces = train*V;
save('eigenface.mat','eigenfaces');
PCA=eigenfaces'*train;
%% test
PCA_x=eigenfaces'*test;
test_data=PCA_x;
dist=zeros(c,15);
for j=1:15
    for i=1:150
        dist(i,j) = sqrt(sum((test_data(:,j) - PCA(:,i)).^2,1)); % calculate the L2 distance
    end
end
[sorted, index] = sort(dist); % sort from small to large
predict=zeros(10000,15);
predict_label=zeros(15);
for i=1:15
    predict(:,i)=train(:,index(1,i));
    %predict_label(i)=train_label{index(1,i)};
end
%% show answer
for i=1:15
    subplot(2,15,i),imshow(reshape(predict(:,i),100,100),[]),title('predict');
    subplot(2,15,i+15),imshow(reshape(test(:,i),100,100),[]),title('real');
end
%% show eigenface
for i=1:25
    subplot(5,5,i),imshow(reshape(eigenfaces(:,i),100,100),[]);
end