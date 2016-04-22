% Borja Bordel Sánchez
%
% Función axuiliar de fdim

function fsq=rampdiff(x,lr,lc,trace)
% Given a set of 4 parameters x(:) for the ramp curve,
% constructs the sum of squares of the differences
% between the data lc and the curve.  Also throws in
% a preference to avoid lr1+ell1>lr2-ell2.
% Used by fdim
% Copyright AJ Roberts, 1994
[n,m]=size(lc);
lr1=x(1);
lr2=x(2);
ell1=x(3)^2+1e-7;
ell2=x(4)^2+1e-7;
a=(lc(n)-lc(1))/(lr2-lr1);
b=(lc(n)+lc(1))/2;
fsq=ramp(lr,lr1,lr2,ell1,ell2,a,b);
if trace, 
    plot(lr,lc,'o',lr,fsq,'-');
end

fsq=sum((lc-fsq).^2)+max(lr1-lr2+ell1+ell2,0)^2;



