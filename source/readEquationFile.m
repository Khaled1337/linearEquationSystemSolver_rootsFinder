function [ equation ] = readEquationFile( fileName )
%READEQUATIONFILE Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen(fileName,'r');
equation = fscanf(fileID, '%s');
fclose(fileID);

end

