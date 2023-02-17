function [r2, vPred]=CheckR2(P, D, eta_i, vMeas)
%check the coefficient of determination of the proposed model, D is withdrawral
%layer depth, P is the size of the outlet

np=numel(D);
P2D=P./D;
m=exp(1.3976).*exp(-0.5902./P2D);
n=1.546386*ones(np,1);
vPred=zeros(np,1);

nflag=0;
for i=1:1:np
    if (eta_i(i)<1)
        vPred(i)=OutflowC_TbC(m(i), n(i), eta_i(i));
    else
        vPred(i)=1;
        nflag=1;
    end
end

%compute R2
MeaBar=mean(vMeas);
SStot=sum((vMeas-MeaBar).^2);
SSres=sum((vMeas-vPred).^2);
r2=1-SSres/SStot;

if nflag==1
    r2=nan;
end
