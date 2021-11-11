function [a, R2]=fit_vProf_paras(x,y)
%fit the velocity profile equation for withdrawral layer with data
%x is the relative depth within the withdrawral layer, y is the relative
%velocity to the maximum velocity

a0=[0.6; 2.2];     %initial guess
[a,r]=nlinfit(x,y,@uFunc,a0);

%plot and compare
eta_vec=linspace(0,1,100).'
u2u_p=u_withdrawLayer(a(1), a(2), eta_vec);
plot(y, x, 'bo', u2u_p, eta_vec, 'r'); 

    function uPredic=uFunc(a, x)
        uPredic=u_withdrawLayer(a(1), a(2), x);
    end
end
