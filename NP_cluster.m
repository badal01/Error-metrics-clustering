    th = 2.5; %%%%%%%%%%%%%%%%%change your threshold here
    clear c
    c{1,1}=1;
    for i = 2:38  %%%%calling each metric
        clear d2
        for i1 =1:numel(c) %% getting each cluster
            el = c{i1,1}; %%%%%%data points of cluster
            clear d1
            for i2 = 1:length(el)
                %b is matrix with error metrics in column and climate models in rows
                d1(i2)  =  mean(abs(b(:,i)-b(:,el(i2)))); %Calculating MAE between cluster data points and new data point
            end
            d2(i1,1) = max(d1); %%Maximum MAE for each cluster
        end
        
        if min(d2) < th 
            [l1 l2] = find(min(d2) == d2);
            c{l1(1),1} = [c{l1(1),1}(:,1);i];
        else
            c{numel(c)+1,1} = i; %%%%%% form a new cluster
        end
    end