%% secant method Implementation
%% Input: 	f	           initial guess for the root 
%%              x0	           initial guess for the root 
%%              x1                 another initial guess for the root
%% 	        tol	           tolerance/accuracy, default Epsilon = 0.00001
%% 	        maxItr	           max number of iterations, default = 50
%% Output: approxmiation to the root
%% Syntax:	secant(x0, x1, tol)
function [root,err,time,msg] = secant(f,x0, x1, tol,maxItr)
msg=' ';
root=[];
err=[];
tic;
f=inline(f);
fx0 = f(x0);                   
fx1 = f(x1);                   
%% xc current approx to a root.
xc = x1- fx1*(x0-x1)/(fx0-fx1); 
fxc = f(xc);
% eps, a MATLAB defined constant for machine epsilon, to avoid division by 0
relerr = abs(xc-x1)/( abs(xc)+eps );
k=1;
root(k)=xc;
err(k)=relerr;

while relerr > tol && k <maxItr
    k=k+1;
    x0=x1;
    fx0=fx1;
    x1=xc;
    fx1=fxc;
    xc = x1- fx1*(x0-x1)/(fx0-fx1); 
    fxc = f(xc);
    relerr = abs(xc-x1)/( abs(xc)+eps );
    root(k)=xc;
    err(k)=relerr;
end
time=toc;
if maxItr==k
    msg='secant did not converge!';
else
    msg='secant converged!';
end
end
