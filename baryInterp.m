function [out,weights] = baryInterp(neighbors,vals,point)
    %compute the barycentric interpolation for an N dimensional point given
    %N+1 neighbors
    
    [N,cols] = size(neighbors);
    assert(N==cols-1)
    assert(all([N,1]==size(point)))
    [~,cols] = size(vals);
    assert(N==cols-1)
    origin = neighbors(:,1);
    M = neighbors(:,2:end)-origin;
    if rank(M)<N %degenerate simplex (no inversion possible)
        options = optimset('Display','off');
        w = fsolve(@(w) M*w-point+origin,ones(N,1)/N,options);
    else
        w = M\(point-origin);
    end
%     M
%     rank(M)<N
%     if rank(M) < N
%         inv(neighbors(:,2:end)-(origin+(0.01*rand()-0.02)))
%     end
%     [fsolve(@(w) M*w-point+origin,ones(N,1)/N),w]
%     point
%     origin
%     neighbors
    M\(point-origin);
    weights = [1-sum(w);w];
    
    out = (weights'*vals')';
end
