function [a, R2]=fit_P_D_vProf(x,y)
%find P/D (P is orifice elevation, D is withdrawral
%layer depth) to best fit the predicted velocity profile with the measured one.

%x is the relative depth within the withdrawral layer, y is the relative
%velocity to the maximum velocity


n=1.5464;

a0=0.39;    %initial guess of P/D

[a]=nlinfit(x,y,@uFunc,a0);

%plot and compare
eta_vec=linspace(0,1,100).';
u2u_p=uFunc(a, eta_vec);
plot(y, x, 'bo', u2u_p, eta_vec, 'r'); 

%calculate coefficient of determination
ym=mean(y);
u2u_at_x=uFunc(a, x);
SS_res=sum((y-u2u_at_x).^2);
SS_tot=sum((y-ym).^2);
R2=1-SS_res/SS_tot;


    function uPredic=uFunc(a, x)
        
        m=exp(1.3976)*exp(-0.5902/a);
        sigma=(m+n)^(m+n)/m^m/n^n;     
        uPredic=sigma*x.^m.*(1-x).^n;
    end
end