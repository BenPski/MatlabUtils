function [neighs,dists,indices] = nearestNeighbors(neighbors,point)
    %given a list of possible nearest neighbors and a point, find the N+1
    %nearest neighbors with N as the dimension of the point
    
    [N,cols] = size(neighbors);
    assert(all([N,1] == size(point))); %properly sized and oriented
    assert(cols-1 >= N); %enough neighbors to look for
    
    %have 2 things to keep track of the distances and the closest neighbors
    %don't have to, but it is convenient to also track the original indices
    %start with first N+1 neighbors
    
    neighs = neighbors(:,1:N+1);
    dists = [];
    indices = 1:N+1;
    for i=1:N+1
        dists(i) = norm(neighs(:,i)-point);
    end
    
    %want to sort these so that the farthest neighbor is at the end of the
    %list to make it easier to place new points in the appropriate places
    
    [dists,index] = sort(dists);
    neighs = neighs(:,index);
    
    
    for i=N+2:cols %check if any neighbors are closer
        n = neighbors(:,i);
        d = norm(n-point);
        comp = d<dists;
        if any(comp)
            index = find(comp==1);
            index = index(1);
            neighs = [neighs(:,1:index-1),n,neighs(:,index:end-1)];
            dists = [dists(1:index-1),d,dists(index:end-1)];
            indices = [indices(1:index-1),i,indices(index:end-1)];
        end
    end
end