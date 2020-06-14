function [T]=find_T(w,N)
Nw=length(w);
T=zeros(1,Nw); 
[H00,H01]=find_H(N);  
for n=1:Nw
    w_n=w(n);
    [SigmaL,SigmaR]=find_Sigma(H00,H01,w_n);
    T(n)=find_T1(H00,SigmaL,SigmaR,w_n,N);
end