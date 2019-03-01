function out = ad(x)
    out = [skew(x(1:3)),zeros(3);skew(x(4:6)),skew(x(1:3))];
end