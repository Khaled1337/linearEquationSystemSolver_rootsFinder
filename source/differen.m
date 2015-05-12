function [ val ] = differen( point, func )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h = 0.0001;
h2 = h/2;

x1 = point +h;
x2 = point - h;
x3 = point + h2;
x4 = point - h2;

val1 = feval(func,x1);
val2 = feval(func,x2);
val3 = feval(func,x3);
val4 = feval(func,x4);

order2 = (val1 - val2)/(x1 -x2);
order1 = (val3 - val4)/(x3 - x4);

val = ((4/3)*(order1))-((1/3)*order2);

end

