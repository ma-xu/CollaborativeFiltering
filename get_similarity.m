function sim_value_userId = get_similarity( id )
    load('rating');
    oneLine = getOneLine(id);
    rating = [rating;oneLine];
    rating = rating';
    corr = corrcoef(rating);
    [corr_line,corr_row] = size(corr);
    similarity = corr(:,corr_row);
    similarity(corr_line)=[];
    
    %% 得到前5的相似度值，用户id矩阵
    [sim_v sim_i]=sort(similarity,1,'descend');
    sim_value_userId = [sim_v(1:5),sim_i(1:5)];
    
    
    
end

