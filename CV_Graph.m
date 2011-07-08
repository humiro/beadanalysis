function  CV_Graph
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
CVDATA = importdata('C:\work\beadanalysis\group5.txt');
CV_LP=[3];
CV_cAOI=[6];

cvvar=[CV_LP CV_cAOI];
cv_size=size(CVDATA.data);
cv1=cv_size(1);
cvmat=zeros(cv1,length(cvvar));

%populate
for i = 1:length(cvvar)
cvmat(:,i) = CVDATA.data(:,cvvar(i));
end
exposure=4;
y=cvmat([exposure:9:cv1],1);
x=conc;
figure;
bar(x,y,'histc');
end

