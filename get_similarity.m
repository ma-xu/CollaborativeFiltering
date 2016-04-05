function sim_value_userId = get_similarity( id )
    %读取makedata弄出的评分矩阵
    load('rating');
    %通过输入的id弄出该用户对各电影的评分向量（未评分为0）
    oneLine = getOneLine(id);
    %将测试用户的评分向量追加到rating末尾
    rating = [rating;oneLine];
    %转置（因为corrcoef算的是列的相似度）
    rating = rating';
    %获得各列之间的皮尔逊相似度
    corr = corrcoef(rating);
    %获取行列，都等于用户数
    [corr_line,corr_row] = size(corr);
    %获取最后一列的相似度，就是输入的id用户的与各个用户的相似度
    similarity = corr(:,corr_row);
    %去除与自身的相似度
    similarity(corr_line)=[];
    
    %% 得到前5的相似度值，用户id矩阵
    [sim_v sim_i]=sort(similarity,1,'descend');
    sim_value_userId = [sim_v(1:5),sim_i(1:5)];
    
    
    
end

