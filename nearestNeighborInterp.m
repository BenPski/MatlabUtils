function out = nearestNeighborInterp(neighbors, values, point)
    %find the nearest neighbors and do linear interpolation (barycentric) on it
    
    [N,cols] = size(neighbors);
    [~,col_vals] = size(values);
    assert(cols==col_vals)
    assert(all([N,1]==size(point)))
    
    [neighs,~,index] = nearestNeighbors(neighbors,point);
    vals = values(:,index);
    
    out = baryInterp(neighs,vals,point);
end