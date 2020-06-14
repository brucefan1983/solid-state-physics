clear; close all;

% Tersoff (1989) parameters fo Si
para=[1.8308e3 471.18 2.4799 1.7322 1.1000e-6 0.78734 1.0039e5...
    16.217 -0.59825 2.7 3.0];

% define the system
nx=5;
ax=5.431;
[r,L,N]=find_r(nx,ax);
L_times_pbc=L.*[1 1 1];

% construct the neighbor list
r_cut=3.0;
tic;
[NN,NL]=find_neighbor(N,r,1.0,r_cut,L,L_times_pbc);
toc;

% calculate the force
tic;
F=find_F(N,r,NN,NL,L,L_times_pbc,para);
toc;

% check the force
figure;
plot(F);
ylabel('F (eV/A)','fontsize',15);
xlabel('atom id','fontsize',15);
legend('F_x','F_y','F_z')
set(gca,'fontsize',15);
