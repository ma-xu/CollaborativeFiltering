function [ oneLine ] = getOneLine( id )
%通过用户的ID获取对各个电影的评分的0向量

%读取测试集（用户ID，电影id，评分，时间戳）
test = load('u1.test');
%去除时间戳
test = test(:,1:3);
%查找到输入用户的id的对电影的所有评分，用户id，电影ID，评分的矩阵
oneTest = test(test(:,1)==id,:);
%直接读取info给的电影数
info = textread('u.info','%n%*[^\n]');
oneLine = zeros(1,info(2));

%% 给电影向量赋值
[oneTestNum,v] = size(oneTest);
for n=1:oneTestNum
    oneTestLine = oneTest(n,:);
    oneLine(oneTestLine(2)) = oneTestLine(3);
end



end

