clear; close all;

% Tersoff (1989) parameters fo Si
para=[1.8308e3 471.18 2.4799 1.7322 1.1000e-6 0.78734 1.0039e5...
    16.217 -0.59825 2.7 3.0];

% define the system
nx=4;
ax=5.431;
[r,L,N]=find_r(nx,ax);
L_times_pbc=L.*[1 1 1];

% construct the neighbor list
tic;
[NN1,NL1]=find_neighbor(N,r,1,3.0,L,L_times_pbc);
[NN2,NL2]=find_neighbor(N,r,-1,4.0,L,L_times_pbc);
toc;

% calculate the dynamic matrix
D=zeros(N*3,N*3);
tic;
for n1=1:N
    for i2=1:NN2(n1)
        n2=NL2(n1,i2);
        D12=find_D(n1,n2,r,NN1,NL1,L,L_times_pbc,para);
        D((n1-1)*3+1:n1*3,(n2-1)*3+1:n2*3)=D12;
    end

end
toc;
D=D/28; % normalize by mass

% Check if the dynamical matrix is symmetric 
if max(max(abs(D-D.')))<1.0e-6
    disp('D is symmetric');
else
    disp('D is not symmetric');
end
% make it symmetric 
D=(D+D.')/2;

% check the acoustic sum rule:
if max(abs(sum(D)))<1.0e-6
    disp('D satisfies the acoustic sum rule');
else
    disp('D violates the acoustic sum rule');  
end
% enforce the acoustic sum rule:
for i2=1:N*3
    D(i2,i2)=-sum(D(:,i2))+D(i2,i2);
end

% get the eigenvalues
tic;omega2=eig(D);toc;
omega=sqrt(omega2);
nu=real(omega)*(1000/10.18)/2/pi; % in units of THz now

figure;
hist(nu,31);
xlabel('\nu (THz)','fontsize',15);
ylabel('number of counts','fontsize',15);
xlim([0,20]);
