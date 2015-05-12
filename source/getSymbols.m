function [A,B] = read( x )
fid=fopen(x);
A=[];
B=[];
        while 1
            tline= fgetl(fid);
            if ~ischar(tline), break, end
            temp=sym(tline);
            [Atemp,Btemp]=equationsToMatrix(temp);
            A=[A;Atemp];
            B=[B;Btemp];
        end
        fclose(fid);
end


