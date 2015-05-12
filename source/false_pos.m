function [ x , ea , final ,msg ] = false_pos( func,xl,xu,es,maxit )
msg=' ';
start = tic;
ea=[];
ea(1) = 0;
x= [];

a (1) = xl;b (1) = xu;
ya (1) = feval (func,a(1)); yb (1) = feval (func, b(1));
if ya (1) * yb (1) > 0.0
    msg='same sign at end points!';
else
for i = 1: maxit
     iter = i;
    x (i) = b (i) - yb (i) * ( b (i) - a (i) ) / ( yb (i) - ya (i) );
    if (i>1)
        ea(i) = abs((x(i) - x(i-1)) / x(i));
    end
    y (i) = feval ( func , x (i) );
    if y (i) == 0.0
        msg='exact zero found';break;
    elseif y (i) * ya (i) < 0
        a (i+1) = a (i) ; ya (i+1) = ya (i);
        b (i+1) = x (i) ; yb (i+1) = y (i);
    else
        a (i+1) = x (i) ; ya (i+1) = y (i);
        b (i+1) = b (i) ; yb (i+1) = yb (i);
    end;
    if ( ( i > 1 ) && ( abs(x(i) - x(i-1)) < es ) )
        msg='false position converged!';break;
    end;
end;
end
if (iter >= maxit)
    msg='root not found to desired tolerance!';
end
n = length(x) ; k = 1:n; out =  [k'    a(1:n)'     b(1:n)'     x'      y'];
final = toc(start);    
end

