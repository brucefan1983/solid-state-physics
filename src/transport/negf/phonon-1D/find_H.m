function [H00,H01]=find_H(N)
H00=eye(N,N)*2;
for m=1:(N-1)
    H00(m,m+1)=-1;
    H00(m+1,m)=-1;
end
H01=zeros(N,N);
H01(N,1)=-1;