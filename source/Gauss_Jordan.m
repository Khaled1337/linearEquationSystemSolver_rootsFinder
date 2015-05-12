function  x = Gauss_Jordan( aaa ,b)
a = [aaa,b];
len = size(a);
length = len(1);
x = zeros(length,1); 
width = len(2);
for i = 1:length
    for j = 1:length
        if  i ~= j
            a(j,:) = a(j,:) - a(i,:).*a(j,i)./a(i,i);
        end
    end
end
for i = 1:length
    x(i) = a(i,width)/a(i,i);
end
end

