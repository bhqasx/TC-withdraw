Zmax=zeros(31,1);
for i=1:1:31
    Qout_r=Qout;
    Qout_r(i)=[];
    
    gpri_r=gpri;
    gpri_r(i)=[];
    
    H_r=H;
    H_r(i)=[];
    
    TbH_r=TbH;
    TbH_r(i)=[];
    
    vMeas_r=vMeas;
    vMeas_r(i)=[];
    
    [X, Y, Z]=Paral_InfluenceWithdrawPara(Qout_r, gpri_r, P, H_r, TbH_r, vMeas_r);
    Zmax(i)=max(max(Z));
end