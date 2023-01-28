function [X, Y, Z]=Paral_InfluenceWithdrawPara(Qout, gpri, P, H, TbH, vMeas, varargin)
%investigate the influence of the parameter in the withdrawal layer
%thickness to the R2 of prediction
%Qout is the total discharge from all sluice gate, gpri is modified gravitational acceleration
%H is water depth;
%TbH is the depth of turbidity current in front of the dam
%P is the centroid height of the outlet

%parpool(16);

if (nargin>6)
    K1=varargin{1}(1);
    K2=varargin{1}(2);
else
    K1=0.63;
    K2=0.9;
end

sumW1=4.4*3;      %total width of outlets
sumW2=25*3;

if (nargin>7)
    nK1=varargin{2};
else
    nK1=30;
end
Kvec=linspace(K1, K2, nK1);
Kvec=Kvec.';

nK2=30;
Wvec=linspace(sumW1, sumW2, nK2);
Wvec=Wvec.';
[X, Y]=meshgrid(Kvec, Wvec);
Z=zeros(numel(Wvec),numel(Kvec));

np=numel(Qout);
%M=0;     %maximum number of workers
M=16;

parfor (iw=1:nK2, M)
    sumW=Wvec(iw);
    
    for i=1:1:nK1
        K=Kvec(i);
        D=zeros(np, 1);
        for j=1:1:np
            D(j)=K*(Qout(j)/sumW)^(2/3)/gpri(j)^(1/3);
            if D(j)>H(j)
                D(j)=H(j);
            end
        end
        eta_i=TbH./D;
        %disp([iw, sumW, i, K]);
        [r2, vPred]=CheckR2(P, D, eta_i, vMeas);
        disp(['r2(', num2str(i), ',', num2str(iw), ') finished']);
        Z(iw, i)=r2;    %attention! the first index should be iw
    end
end

% figure;
% surf(X, Y, Z);
% xlabel('K');
% ylabel('total width');
% zlabel('R2');