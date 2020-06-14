function [F]=find_F(N,r0,NN,NL,L,L_times_pbc,para)
F=zeros(N,3);
delta=0.001; % small displacement used in finite difference
factor=1/delta/2;
for n1=1:N % N atoms
    for alpha=1:3 % 3 directions
        % copy the positions first
        rp = r0;
        rm = r0;
        % make small shift
        rp(n1,alpha)=rp(n1,alpha)+delta; % plus
        rm(n1,alpha)=rm(n1,alpha)-delta; % minus
        % calculate the energies
        ep=find_E(n1,n1,L,L_times_pbc,rp,NN,NL,para);
        em=find_E(n1,n1,L,L_times_pbc,rm,NN,NL,para);
        % use finite difference to obtain the force
        F(n1,alpha)=(em-ep)*factor;
    end
end
