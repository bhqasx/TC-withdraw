function [r_cout_c]=OutflowC_TbC(m, n, eta_i)
%calculate the ratio between the outflow concentration and the layer
%averaged concentration of the turbidity current before the dam

if nargin==2
    eta_i=1;
end

syms eta;
sm=sym(m);
sn=sym(n);

expr=eta^sm*(1-eta)^sn;
Feta=vpaintegral(expr, eta, 0, eta_i);

vgamma=gamma(m+n+2)/gamma(m+1)/gamma(n+1);
r_cout_c=vgamma*Feta;