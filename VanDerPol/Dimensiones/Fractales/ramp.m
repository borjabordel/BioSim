% Borja Bordel Sánchez
%
% Función auxiliar de fdim

function lc=ramp(lr,lr1,lr2,ell1,ell2,a,b)
% computes a transcendental curve of two horizontal
% segments separated by a ramp and with exponentially rapid transitions.
% Used by fdim.
% copyright AJ Roberts, 1994.
x1=(lr-lr1)/ell1;
x2=(lr-lr2)/ell2;
x1=abs(x1)+log(1+exp(-2*min(20,abs(x1))));
x2=abs(x2)+log(1+exp(-2*min(20,abs(x2))));
lc=b+a*0.5*(ell1*x1-ell2*x2 );
end

