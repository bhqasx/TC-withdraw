Zmax=zeros(29,1);

%----------------------------
i=26;
Qout_r=Qout;
Qout_r(i)=[];
QoutOld=Qout_r;

gpri_r=gpri;
gpri_r(i)=[];
gpriOld=gpri_r;

H_r=H;
H_r(i)=[];
HOld=H_r;

TbH_r=TbH;
TbH_r(i)=[];
TbHOld=TbH_r;

vMeas_r=vMeas;
vMeas_r(i)=[];
vMeasOld=vMeas_r;

%--------------------------------
i=17;
Qout_r(i)=[];
QoutOld=Qout_r;

gpri_r(i)=[];
gpriOld=gpri_r;

H_r(i)=[];
HOld=H_r;

TbH_r(i)=[];
TbHOld=TbH_r;

vMeas_r(i)=[];
vMeasOld=vMeas_r;

for i=1:1:29
    Qout_r=QoutOld;
    Qout_r(i)=[];
    
    gpri_r=gpriOld;
    gpri_r(i)=[];
    
    H_r=HOld;
    H_r(i)=[];
    
    TbH_r=TbHOld;
    TbH_r(i)=[];
    
    vMeas_r=vMeasOld;
    vMeas_r(i)=[];
    
    [X, Y, Z]=Paral_InfluenceWithdrawPara(Qout_r, gpri_r, P, H_r, TbH_r, vMeas_r);
    Zmax(i)=max(max(Z));
end