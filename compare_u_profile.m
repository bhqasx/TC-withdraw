function [nCali]=compare_u_profile(m, n)
%Observe the shape of velocity profile for withdrawral layer


eta_vec=(linspace(0, 1, 100)).';
u_umax=zeros(100,1);

for i=1:1:100
    eta=eta_vec(i);
    u_umax(i)=u_withdrawLayer(m, n, eta);
end

plot(u_umax, eta_vec);

nCali=1;