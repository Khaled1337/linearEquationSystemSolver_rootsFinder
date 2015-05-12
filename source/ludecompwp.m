function X= ludecompwp( A,B )
n = size(A,1);
A= [A,B];
L=eye(n); 
P=L; 
U=A;
d = zeros(n,1);
X = zeros(n,1); 
%forward elimination
for k=1:n
    [pivot m]=max(abs(U(k:n,k)));
    m=m+k-1;
    if m~=k
        % interchange rows m and k in U
        temp=U(k,:);
        U(k,:)=U(m,:);
        U(m,:)=temp;
        % interchange rows m and k in P
        temp=P(k,:);
        P(k,:)=P(m,:);
        P(m,:)=temp;
        if k >= 2
            temp=L(k,1:k-1);
            L(k,1:k-1)=L(m,1:k-1);
            L(m,1:k-1)=temp;
        end
    end
    for j=k+1:n
        L(j,k)=U(j,k)/U(k,k);
        U(j,:)=U(j,:)-L(j,k)*U(k,:);
    end
    
end

L=[L,B];
d(1) = L(1,n+1)/L(1,1);
for i = 2:n
    d(i) = (L(i,n+1) - L(i,1:i-1)*d(1:i-1))/L(i,i);
end

 
aug = [U,d];
X(n) = aug(n,n+1)/aug(n,n);
for i = n-1:-1:1
    X(i) = (aug(i,n+1) - aug(i,i+1:n)*X(i+1:n))/aug(i,i);
end

end

 