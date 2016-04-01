function [ oneLine ] = getOneLine( id )
%通过用户的ID获取对各个电影的评分的0向量
test = load('u1.test');
test = test(:,1:3);
oneTest = test(test(:,1)==id,:);
info = textread('u.info','%n%*[^\n]');
oneLine = zeros(1,info(2));

%% 给电影向量赋值
[oneTestNum,v] = size(oneTest);
for n=1:oneTestNum
    oneTestLine = oneTest(n,:);
    oneLine(oneTestLine(2)) = oneTestLine(3);
end



end

