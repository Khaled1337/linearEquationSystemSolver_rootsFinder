%% Author: Abanoub Milad Nassief
%% Date  : 1 May 2015
%%
%% gauss elimination with partial pivoting method Implementation
%% Solve linear system Ax = b
%% using Gaussian elimination with partial pivoting
%% Input: 	a	 Coef. of matrix a; 2-D array
%%          b    Coef. of vector b; 1-D array
%% Output:  x	 Coef. of vector x 
%% Syntax: gauss(a,b)
function x = gaussPivot(a,b)
n = size(a,1);
x = zeros(n,1);  
a = [a,b]; 

%forward elimination
for i = 1:n-1
    % set pivot
    max=i;
    for row = i+1:n
        if abs(a(row,i)) > abs(a(max,i))
            max=row;     
        end
    end
    if(max~=i)
        temp = a(i,:);
        a(i,:) = a(max,:);
        a(max,:) = temp;   
    end
    
    %forward elimination step action
    m = a(i+1:n,i)/a(i,i);
    a(i+1:n,:) = a(i+1:n,:) - m*a(i,:);
end

% back substitution
x(n) = a(n,n+1)/a(n,n);
for i = n-1:-1:1
    x(i) = (a(i,n+1) - a(i,i+1:n)*x(i+1:n))/a(i,i);
end
end


