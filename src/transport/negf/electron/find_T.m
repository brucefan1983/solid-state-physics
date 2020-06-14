function [T]=find_T(E,Nx,Ny,W,Nr,flag)
Ne=length(E);
T=zeros(Nx,Ne);
[H00,H01]=find_H(Ny);
for ne=1:Ne
    e=E(ne);
    [SigmaL,SigmaR]=find_Sigma(H00,H01,e);
    for nr=1:Nr
        T1=find_T1(H00,H01,SigmaL,SigmaR,e,Nx,Ny,W);
        if flag==1
            T(:,ne)=T(:,ne)+T1;
        else
            T(:,ne)=T(:,ne)+log(T1);
        end
    end
    if flag==1
        T(:,ne)=T(:,ne)/Nr;
    else
        T(:,ne)=exp(T(:,ne)/Nr);
    end
end