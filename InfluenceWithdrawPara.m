function r2vec=InfluenceWithdrawPara(Qout, gpri, P, H, TbH, vMeas)
%investigate the influence of the parameter in the withdrawal layer
%thickness to the R2 of prediction
%Qout is the total discharge from all sluice gate, gpri is modified gravitational acceleration
%H is water depth;
%TbH is the depth of turbidity current in front of the dam
%P is the centroid height of the outlet

K1=0.63;
K2=0.9;
sumW=4.4*3;      %total width of outlets

nK=30;
Kvec=linspace(K1, K2, nK);
Kvec=Kvec.';
np=numel(Qout);
D=zeros(np, 1);
r2vec=zeros(nK, 1);

for i=1:1:nK
    K=Kvec(i);
    for j=1:1:np
        D(j)=K*(Qout(j)/sumW)^(2/3)/gpri(j)^(1/3);
        if D(j)>H(j)
            D(j)=H(j);
        end
    end
    eta_i=TbH./D;
    [r2vec(i), vPred]=CheckR2(P, D, eta_i, vMeas);
    disp(['r2vec(', num2str(i), ') finished']);
end

plot(Kvec, r2vec, 'o-');