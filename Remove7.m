%Zmax=zeros(26,1);
Zmax=[0, 0, 0];  %the first two elements are indices of removed data, the third one is the max r2

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

%-------------------------------
i=16;
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

%--------------------------------
i=16;
j=21;
Qout_r=QoutOld;
Qout_r([i,j])=[];
QoutOld=Qout_r;

gpri_r=gpriOld;
gpri_r([i,j])=[];
gpriOld=gpri_r;

H_r=HOld;
H_r([i,j])=[];
HOld=H_r;

TbH_r=TbHOld;
TbH_r([i,j])=[];
TbHOld=TbH_r;

vMeas_r=vMeasOld;
vMeas_r([i,j])=[];
vMeasOld=vMeas_r;


for i=1:1:25
    for j=(i+1):1:26
        Qout_r=QoutOld;
        Qout_r([i,j])=[];
        
        gpri_r=gpriOld;
        gpri_r([i,j])=[];
        
        H_r=HOld;
        H_r([i,j])=[];
        
        TbH_r=TbHOld;
        TbH_r([i,j])=[];
        
        vMeas_r=vMeasOld;
        vMeas_r([i,j])=[];
        
        [X, Y, Z]=Paral_InfluenceWithdrawPara(Qout_r, gpri_r, P, H_r, TbH_r, vMeas_r);
        Zmax=[Zmax; i, j, max(max(Z))];
    end
end