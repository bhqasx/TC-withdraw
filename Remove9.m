Zmax=[0, 0, 0];  %the first two elements are indices of removed data, the third one is the max r2

QoutOld=Qout_r;
gpriOld=gpri_r;
HOld=H_r;
TbHOld=TbH_r;
vMeasOld=vMeas_r;

for i=1:1:23
    for j=(i+1):1:24
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