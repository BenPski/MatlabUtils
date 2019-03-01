function out = csd(f,x)
    %complex step derivative
    
    h = 1e-8; %good enough
    for i=1:length(x)
        y = x;
        y(i) = y(i)+1.0i*h;
        out(i) = imag(f(y))/h;
    end
    %out = imag(f(x+1.0i*h))/h;
end