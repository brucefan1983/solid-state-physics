function [g00]=find_g00(H00,H01,E)
E=E+0.0001i;
N=size(H00,1); 
epsilon=10^(-15);
E0=E*eye(N);
s=H00; 
e=H00; 
a=H01; 
while (max(max(abs(a)))>epsilon)
    E=E0-e;
    b=a.';
    ga=E\a;
    gb=E\b;
    agb=a*gb;
    s=s+agb;
    e=e+agb+b*ga;
    a=a*ga;
end
g00=inv(E0-s);