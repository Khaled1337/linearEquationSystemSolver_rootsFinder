function [A,B,symbols] = read( x )

A=[];
B=[];
symbols=[];
str=[];

fid=fopen(x);
        while 1
            tline= fgetl(fid);
            if ~ischar(tline), break, end
            str=[str,tline];
        end
        fclose(fid);
        symbols=symvar(str);
  
        variables =sym(symbols);
        fid=fopen(x);
         while 1
            tline= fgetl(fid);
            if ~ischar(tline), break, end
            [Atemp,Btemp]=equationsToMatrix(sym(tline),variables);
            A=[A;Atemp];
            B=[B;Btemp];
        end
        fclose(fid);
end


