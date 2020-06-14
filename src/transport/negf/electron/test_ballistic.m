clear;close all;font_size=12;line_width=2; 
E=(-4.1:0.02:4.1);Nx=1;Ny=2;W=0;Nr=1;
tic;T=find_T(E,Nx,Ny,W,Nr,1);toc;

figure;
plot(E,T,'b-','linewidth',line_width);
xlabel('Energy (t)','fontsize',font_size);
ylabel('Transmission','fontsize',font_size);
xlim([E(1),E(end)]);
ylim([-0.5,max(T)+0.5]);
grid on;
set(gca,'fontsize',font_size);
set(gca,'ticklength',get(gca,'ticklength')*2);