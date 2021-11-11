function [a, R2]=fit_vProf_paras(x,y)
%fit the velocity profile equation for withdrawral layer with data
%x is the relative depth within the withdrawral layer, y is the relative
%velocity to the maximum velocity

a0=[0.6; 2.2];     %initial guess
[a]=nlinfit(x,y,@uFunc,a0);

%plot and compare
eta_vec=linspace(0,1,100).';
u2u_p=u_withdrawLayer(a(1), a(2), eta_vec);
plot(y, x, 'bo', u2u_p, eta_vec, 'r'); 

%calculate coefficient of determination
ym=mean(y);
u2u_at_x=u_withdrawLayer(a(1), a(2), x);
SS_res=sum((y-u2u_at_x).^2);
SS_tot=sum((y-ym).^2);
R2=1-SS_res/SS_tot;

    function uPredic=uFunc(a, x)
        uPredic=u_withdrawLayer(a(1), a(2), x);
    end
end
