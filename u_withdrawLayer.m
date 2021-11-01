function [u_umax]=u_withdrawLayer(eta_b, n, eta)
%velocity distribution in withdrawral layer.
%eta_b=zb/D, D is the thickness of withdrawral layer, zb should be
%negative.

if eta_b>0
    disp('eta_b should be negative');
    return;
end

sigma=(-eta_b)^((-n*eta_b)/(1+eta_b))*(1+eta_b)^n;
sigma=1/sigma;

u_umax=sigma*(eta-eta_b)^((-n*eta_b)/(1+eta_b))*(1+eta_b-eta)^n;