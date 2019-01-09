function out = fromConfig(g)
    out = [extractAngles(g(1:3,1:3));g(1:3,4)];
end