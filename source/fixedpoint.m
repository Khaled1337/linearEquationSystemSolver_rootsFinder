%% fixed point method Implementation
%% Input: 	g	          given function, f (x), construct an auxiliary function g(x) such that
%%                                p = g(p) whenever f (p) = 0, i.e. f(x) ===> x=g(x)
%%              p0                initial guess for the root 
%% 	        tol	          tolerance/accuracy, default Epsilon = 0.00001
%% 	        maxItr	          max number of iterations, default = 50
%% Output: approxmiation to the root 
%% Syntax: fixedpoint(g,p0,tol,maxItr)
function [root,err,time,msg] = fixedpoint(g,p0,tol,maxItr)
msg=' ';
root=[];
err=[];
tic;
g=inline(g);
for k=1:maxItr
p = g(p0);
relerr = abs(p-p0)/( abs(p)+eps );
root(k)=p;
err(k)=relerr;

% eps, a MATLAB defined constant for machine epsilon, to avoid division by 0
if (relerr<tol)
root = p;
err=relerr;
time=toc;
msg='fixedpoint converged!';
return;
end
p0 = p;
end
root=p;
time=toc;
err=relerr;
msg='fixedpoint did not converge!';
end
