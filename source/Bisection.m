function [lowerror,root, upperror , error , time,msg] = Bisection(low, high , accuracy , func ,numIterror) 
msg=' ';
lowerror=[];
root=[];
upperror=[];
error=[];
tic;
f=inline(func);
itr = abs (log2((high-low)/accuracy));
if(itr < numIterror)
    itrate = itr;
else 
    itrate = numIterror;
end

    acr = accuracy;

hval= f(high);
lval = f(low);
if hval*lval> 0 
lowerror(1)=low;
root(1)=(low+high)/2;
upperror(1)=high;
error(1)=1;
time = toc;
msg='no bracket!';
    return;
elseif hval*lval==0   
        lowerror(1)=low;
upperror(1)=high;
     time = toc;
     error(1)=0;
     if(hval==0)
root(1)=high;
     else
         root(1)=low;
     end
    return;
end

previous_root=0;
for i=1: itrate
    current_root=(low+high)/2 ;
    ea = abs((current_root-previous_root)/current_root); 
    previous_root=current_root;
    tval= f(current_root); 
    if ( lval* tval < 0)
        high=current_root;
    else
        low=current_root;
    end
    
     lowerror(i)= low;
    root(i)= current_root;
    upperror(i) = high;
    error(i) = ea;
    
   if (ea < acr)
       msg='root found!';
       time =toc;
        return; 
   end
end
  time = toc;
if (ea > acr)
        msg='root not found to the desired tolerance!';
end
end
