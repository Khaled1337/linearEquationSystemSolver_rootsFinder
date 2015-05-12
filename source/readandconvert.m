function [ a ,b ] = readandconvert( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

q =0;
fileID = fopen(x,'r');
[R,count] = fscanf(fileID, '%s');
fclose(fileID);
for i=1:1:count
     w = textscan(R(i),'%s','delimiter',' =');
     w = w{1};
    q(i)= w(1);
    b(i)= w(2);   
end
for i=1:1:count
    s = symvar(q(i));
    a = equationsToMatrix(q,s);
end


