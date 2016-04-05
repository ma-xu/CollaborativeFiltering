clear;clc; 
%获取电影数据结构
items = importdata('u.item','|',0);
%获取电影id列表
itemIds = items.textdata(:,1);
%读取训练集（用户id，电影id，评分，时间戳）
base = load('u1.base');
%去除时间戳
base = base(:,1:3);
%读取用户id列表
users = load('u.user');
%获取电影数
[itemNum,v]=size(itemIds);
%获取用户数
[userNum,v]=size(users);
%定义电影，用户，评分的矩阵。电影为纬度，先定义零矩阵
rating =zeros(userNum,itemNum);
%获取评分的树木，然后循环
[baseNum,v] = size(base);
%循环将评分塞入rating矩阵
for n=1:baseNum
	baseLine = base(n,:);
	line = baseLine(1);
	row = baseLine(2);
	value = baseLine(3);
	rating(line,row) = value;
end
%将rating矩阵保存为文件
save('rating.mat','rating');