%% guess method Implementation
function [first,second,flag] = guess(f)
flag=0;
f=inline(f);
maxItr=1000;
shift_right=2;
shift_left=-2;

if f(0)==0
    first=0;
    second=0;
    flag=1;
    return;
end
    
    fx0_right=0;
    fx1_right=shift_right;
    fx0_left=0;
    fx1_left=shift_left;
for step=2:maxItr
    if(f(fx0_right)*f(fx1_right)<0)
           first=fx0_right;
          second=fx1_right;
          flag=2;
          return;
    elseif(f(fx0_right)*f(fx1_right)==0)
       flag=1;
        if(f(fx0_right)==0)
             first=fx0_right;
          second=fx0_right;
          return;
        else
              first=fx1_right;
          second=fx1_right;
          return;
        end
    else
        fx0_right=fx1_right;
        fx1_right=fx1_right+shift_right;
    end
    
    if(f(fx0_left)*f(fx1_left)<0)
           first=fx0_left;
          second=fx1_left;
          flag=2;
          return;
   elseif(f(fx0_left)*f(fx1_left)==0)
        flag=1;
        if(f(fx0_left)==0)
             first=fx0_left;
          second=fx0_left;
          return;
        else
              first=fx1_left;
          second=fx1_left;
          return;
        end
    else
        fx0_left=fx1_left;
        fx1_left=fx1_left+shift_left;
    end    
end
end
