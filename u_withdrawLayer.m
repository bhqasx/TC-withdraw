function [u_umax]=u_withdrawLayer(m, n, eta)
%velocity distribution in withdrawral layer.
%eta_b=zb/D, D is the thickness of withdrawral layer, zb should be
%negative.


sigma=(m+n)^(m+n)/m^m/n^n;

u_umax=sigma*eta.^m.*(1-eta).^n;