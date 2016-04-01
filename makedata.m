clear;clc;
items = importdata('u.item','|',0);
itemIds = items.textdata(:,1);
base = load('u1.base');
base = base(:,1:3);
users = load('u.user');
[itemNum,v]=size(itemIds);
[userNum,v]=size(users);
rating =zeros(userNum,itemNum);
[baseNum,v] = size(base);
for n=1:baseNum
	baseLine = base(n,:);
	line = baseLine(1);
	row = baseLine(2);
	value = baseLine(3);
	rating(line,row) = value;
end
save('rating.mat','rating');