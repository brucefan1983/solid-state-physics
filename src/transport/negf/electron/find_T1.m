function T=find_T1(H00,H01,SigmaL,SigmaR,E,Nx,Ny,W)
T=zeros(Nx,1);
GammaR=imag(SigmaR);
for nx=1:Nx     
    HW=(rand(Ny,1)-0.5)*W;
    H00_disorder=H00+diag(HW);
    H00_disorder=E*eye(Ny)-H00_disorder;
    GammaL=imag(SigmaL);
    temp1=(H00_disorder-SigmaL-SigmaR)\GammaL;
    temp2=(H00_disorder-SigmaL'-SigmaR')\GammaR;
    T(nx)=4*real(trace(temp1*temp2));
    SigmaL=H01'/(H00_disorder-SigmaL)*H01;
end
