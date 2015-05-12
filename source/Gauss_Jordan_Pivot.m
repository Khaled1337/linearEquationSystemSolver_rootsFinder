function  x  = Gauss_Jordan_Pivot(aaa,b )
a = [aaa,b];
len = size(a);
length = len(1);
x = zeros(length,1); 
width = len(2);
for i = 1:length
max=i;
    for row = i+1:length
        if abs(a(row,i)) > abs(a(max,i))
            max=row;     
        end
    end
    if(max~=i)
        temp = a(i,:);
        a(i,:) = a(max,:);
        a(max,:) = temp;   
    end

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

