function DOS=find_dos(M,E_max,E,H,phi)
H=H/E_max;
E=E/E_max;
phi_1=phi;
phi_2=H*phi_1;
DOS=zeros(length(E),1);
CnDOS=zeros(M,1);
CnDOS(1)=1;
CnDOS(2)=phi'*phi_2;
for m=3:M
    temp=phi_2;
    phi_2=2.0*H*phi_2-phi_1;
    phi_1=temp;
    CnDOS(m)=phi'*phi_2; 
end
for m=0:M-1 % Apply a damping factor (Jackson kernel)
    a=1.0/(M+1);
    g=(1-m*a)*cos(pi*m*a)+a*sin(pi*m*a)/tan(pi*a);
    CnDOS(m+1)=CnDOS(m+1)*g;
end
for ne=1:length(E) % Perform the Chebyshev Summation
    T1=1.0;
    T2=E(ne);
    DOS(ne)=CnDOS(2)*T2;
    for m=3:M
        T_temp=T2;
        T2=2.0*E(ne)*T2-T1;
        T1=T_temp;
        DOS(ne)=DOS(ne)+CnDOS(m)*T2;
    end
    DOS(ne)=(DOS(ne)*2.0+CnDOS(1))*2.0/pi/sqrt(1.0-E(ne)*E(ne))/E_max; 
end  
DOS=real(DOS);

