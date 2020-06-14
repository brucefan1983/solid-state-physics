function [D]=find_D(n1,n2,r0,NN,NL,L,L_times_pbc,para)
D=zeros(3,3);
delta=0.001; % small displacement (in units of A) used in finite difference
factor=1/delta/delta/4;
for alpha=1:3 % 3 directions for n1
    for beta=1:3 % 3 directions for n2
        % copy the positions first
        rpp = r0;
        rmm = r0;
        rpm = r0;
        rmp = r0;
        % make small shift
        rpp(n1,alpha)=rpp(n1,alpha)+delta; % plus
        rpp(n2,beta)=rpp(n2,beta)+delta; % plus
        rmm(n1,alpha)=rmm(n1,alpha)-delta; % minus
        rmm(n2,beta)=rmm(n2,beta)-delta; % minus
        rpm(n1,alpha)=rpm(n1,alpha)+delta; % plus
        rpm(n2,beta)=rpm(n2,beta)-delta; % minus
        rmp(n1,alpha)=rmp(n1,alpha)-delta; % minus
        rmp(n2,beta)=rmp(n2,beta)+delta; % plus
        % calculate the energies
        epp=find_E(n1,n2,L,L_times_pbc,rpp,NN,NL,para);
        emm=find_E(n1,n2,L,L_times_pbc,rmm,NN,NL,para);
        epm=find_E(n1,n2,L,L_times_pbc,rpm,NN,NL,para);
        emp=find_E(n1,n2,L,L_times_pbc,rmp,NN,NL,para);
        % use finite difference to obtain the force constant
        D(alpha,beta)=(epp+emm-epm-emp)*factor;
    end
end
