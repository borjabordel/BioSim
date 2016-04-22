% Borja Bordel Sánchez
%
% Función que calcula la dimension fractal generalizada.

function [dq,rq]=fdim(q,x,trace);
% [dq, rq] = fdim(q, x, trace)
% Estimates generalised fractal dimensions of a set of points x;
% e.g. q=0 is Hausdorf,  q=1 is Information,  q=2 is Correlation,  etc.
% v0.20   1/7/94, copyright AJ Roberts, aroberts@usq.edu.au
% Made publically available under the GNU arrangements.
%
% x(j,:) = coordinates of the jth point of a set
%   q    = row vector of exponents
%  dq    = corresponding row of qth generalised dimension
%  rq    = optimistic range-factor over which the dim holds
% trace  = optional argument: set to 1 if you want trace prints and graphics
%          otherwise omit or set to 0
%
% The following parameters may be changed---at your own risk.
rrat=2;   % square of radius-ratio for covering disks.  
tol=0.03; % approx error in minimisation of curve fit.
%
if nargin<3, trace=0; end
[n,m]=size(x);
lrat=log(rrat);
rmax=sqrt(m)*max(max(x)-min(x));
lrrmax=2*log(rmax);
if trace, 
    disp('computing distance histogram'); 
end;
t0=clock;
unwarn=0;   % change to 1 to display warning about time
nor=[];
for j=1:n,
    rr= sum( [ zeros(n,1)  (x-ones(n,1)*x(j,:) ).^2 ]' );
    k=1+floor( (lrrmax-log(rr(rr>0)))/lrat );
    nor(j,max(k))=0;
    for l=k,
        nor(j,l)=nor(j,l)+1; 
    end;
    if unwarn, 
        et=etime(clock,t0);
        if (et>5)&(2*j<n),
            et= (n-j)*5/j;
            disp([num2str(et) ' secs to go']);
            unwarn=0;
        end;
    end;
end;
nor=cumsum([ones(1,n);flipud(nor')])'/n;
[j,nr]=size(nor);
lrat=lrat/2;
lrad=log(rmax)+((-nr+1):0)*lrat;
%
% fit the curves for each exponent q
% Ref: Pawelzik & Schuster, Phys Rev A 35 (1987) pp481--484.
lrad=[lrad(1)-lrat lrad lrad(nr)+lrat]'; % pad out
dq=[];
rq=[];
for qi=q,
    disp(['analysing q = ' num2str(qi)]);
    if abs(qi-1)>sqrt(eps) , 
        lc=log( sum( nor.^(qi-1) )/n )/(qi-1);
    else 
        lc=sum( log(nor) )/n;
    end;
    j=find((lc<0.1*lc(1))&(lc>0.9*lc(1)));
    p=[lrad(min(j)) lrad(max(j)+2) 0.5 0.5];
    p=fmins('rampdiff',p,[0 tol],[],lrad,[lc(1) lc 0]',trace);
    di=(lc(nr)-lc(1))/(p(2)-p(1));
    dq=[dq di];
    rq=[rq p(2)-p(1)];
    if trace, 
        title(['q = ' num2str(qi) '  Dq = ' num2str(di)]); 
        pause(1); 
    end 
end;
rq=exp(rq);


