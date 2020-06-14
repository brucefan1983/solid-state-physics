function [H00,H01]=find_H(N)
H00=zeros(N,N);
for m=1:(N-1)
    H00(m,m+1)=-1.0;
    H00(m+1,m)=-1.0;
end
H01=-1.0*eye(N);