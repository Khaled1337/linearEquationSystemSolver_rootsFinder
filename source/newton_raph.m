function [ x , ea , final,msg] = newton_raph( func,x,es,maxit )
msg=' ';
start = tic;
x(1) = x;
for i = 1:maxit
     iter = i;    
     x (i+1) = x (i) - ( feval (func,x(i)) / differen (x(i),func));
     ea(i+1) = abs(( x (i+1) - x (i) ) / x (i+1));
    if ea(i+1) < es
        break;
    end
end
if (iter >= maxit)
    msg='root not found to the desired tolerance!';
end
final = toc (start);
end

