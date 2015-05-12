%% Author: Abanoub Milad Nassief
%% Date  : 1 May 2015
%%
%% gauss elimination method Implementation
%% Solve linear system ax = b
%% using Gaussian elimination without pivoting
%% Input: 	a	 Coef. of matrix a; 2-D array
%%          b    Coef. of vector b; 1-D array
%% Output:  x	 Coef. of vector x 
%% Syntax: gauss(a,b,n)
function x = gauss(a,b)
n = size(a,1);
x = zeros(n,1);  
a = [a,b]; 
%forward elimination
for i = 1:n-1
    m = a(i+1:n,i)/a(i,i);
    a(i+1:n,:) = a(i+1:n,:) - m*a(i,:);
end;
% back substitution
x(n) = a(n,n+1)/a(n,n);
for i = n-1:-1:1
    x(i) = (a(i,n+1) - a(i,i+1:n)*x(i+1:n))/a(i,i);
end
end
 
