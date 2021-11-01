function [nCali]=compare_u_profile(n)
%Calibrate n in velocity profile function for withdrawral layer

eta_zb=1/30;

eta_vec=linspace(0, 1, 100);
u_umax=zeros(100,1);

for i=1:1:100
    eta=eta_vec(i);
    u_umax(i)=u_withdrawLayer(eta_b, n, eta);
end

plot(u_umax, eta_vec);