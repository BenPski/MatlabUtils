function out = toConfig(delta)
    out = [R(delta(1:3)),delta(4:6);0,0,0,1];
end