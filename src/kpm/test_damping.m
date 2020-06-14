M=1000;
m=0:1:M-1;
a=1/(M+1);
g=(1-m*a).*cos(pi*m*a)+a*sin(pi*m*a)/tan(pi*a);
f=sinh(4*(1-m/M))/sinh(4);% Lorentz-4

close all;
plot(m,g,'-','linewidth',2);
%legend('Jackson','Lorentz');
ylabel('Jackson kernel g_m','fontsize',15);
xlabel('m','fontsize',15);
title('M = 1000','fontsize',15);
set(gca,'fontsize',15)


