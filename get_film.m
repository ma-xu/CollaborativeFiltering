function films = get( id )
    sim_value_userId = get_similarity(id);
    base = load('u1.base');
    items = importdata('u.item','|',0);
    films = [];
    %前5名相似度遍历电影
    for n=1:5
        first_base = base(base(:,1)==sim_value_userId(n,2),:);
        first_base_top = first_base(find(first_base(:,3)==5),:);
        films_items = items.textdata(first_base_top(:,2),2);
        films = [films;films_items];
    end
    films = unique(films);
end

