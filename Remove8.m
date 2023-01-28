Zmax=[0, 0];  %the first element is the indice of removed data, the second one is the max r2

QoutOld=Qout_r;
gpriOld=gpri_r;
HOld=H_r;
TbHOld=TbH_r;
vMeasOld=vMeas_r;

for i=1:1:24
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
        Zmax=[Zmax; i, max(max(Z))];
end