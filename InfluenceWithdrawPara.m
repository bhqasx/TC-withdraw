function r2vec=InfluenceWithdrawPara(q, gpri, P, TbH, vMeas)
%investigate the influence of the parameter in the withdrawal layer
%thickness to the R2 of prediction
%q is discharge per outlet, gpri is modified gravitational acceleration
%TbH is the depth of turbidity current in front of the dam

K1=0.63;
K2=0.9;

Kvec=linspace(K1, K2, 30);
Kvec=Kvec.';
np=numel(q);
D=zeros(np, 1);
r2vec=zeros(np, 1);

for i=1:1:30
    K=Kvec(i);
    for j=1:1:np
        D(j)=K*(q(j)/4.4)^(2/3)/gpri(j)^(1/3);
    end
    eta_i=TbH./D;
    r2vec(i)=CheckR2(P, D, eta_i, vMeas);
    disp(['r2vec(', num2str(i), ') finished']);
end

plot(Kvec, r2vec, 'o-');