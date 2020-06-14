% NEGF method for phonon transport: One dimensional atomic chain
clear;close all;
font_size=12;line_width=2; 
w=0.01:0.01:3; % sqrt(k/m)
N=8; % any positive integer gives the same transmission

[T]=find_T(w,N);

figure;   
plot(w,T,'b-','linewidth',line_width);
xlabel('$\omega$ $(\sqrt{k/m})$','fontsize',font_size,'interpreter','latex');
ylabel('Transmission','fontsize',font_size);
xlim([0,w(end)*1.1]);
ylim([-0.1,max(T)*1.1]);
set(gca,'fontsize',font_size)