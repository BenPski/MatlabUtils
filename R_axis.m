function out = R_axis(x,a)
    %given the axis x and angle a give rotation matrix
    x = reshape(x,3,1);
    out = cos(a)*eye(3)+sin(a)*skew(x)+(1-cos(a))*x*x';
end