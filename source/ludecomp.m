function x = ludecomp( a,b )
n = size(a,1);
x = zeros(n,1); 
u=a;
l = eye(n);
d = zeros(n,1); 

for i = 1:n-1
    l(i+1:n,i)= u(i+1:n,i)/u (i,i);
    m = u(i+1:n,i)/u(i,i);
    u(i+1:n,:) = u(i+1:n,:) - m*u(i,:);
end
l=[l,b];
d(1) = l(1,n+1)/l(1,1);
for i = 2:n
    d(i) = (l(i,n+1) - l(i,1:i-1)*d(1:i-1))/l(i,i);
end
aug = [u,d];
x(n) = aug(n,n+1)/aug(n,n);
for i = n-1:-1:1
    x(i) = (aug(i,n+1) - aug(i,i+1:n)*x(i+1:n))/aug(i,i);
end

end

 