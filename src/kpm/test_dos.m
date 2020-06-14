clear; close all;
W = 0; % Anderson disorder strength (-W/2 <= U_i <= W/2)
% direct diagonalization (100 * 100 lattice)
Nx = 200; Ny = 200; N = Nx * Ny;
tic; H = find_H(Nx, Ny, W); toc;
Hfull = zeros(N, N);
for n1=1:N
    for n2=1:N
        Hfull(n1, n2) = H(n1, n2);
    end
end
tic; energies = eig(Hfull); toc;
% kernel polynomial method (1000 * 1000 lattice)
Nx = 1000; Ny = 1000;
E = (-1.0 : 0.001 : 1.0) * (4 + W / 2);
E_max = max(E) * 1.1; % to be safe
M = 500; % number of moments in the Chebyshev expansion
tic; H = find_H(Nx, Ny, W); toc;
initial_state = create_state(Nx * Ny);
tic; dos = find_dos(M, E_max, E, H, initial_state); toc;
% plot the results
figure;
[n, f] = hist(energies, 51);
bar(f, n ./ (sum(n) * (max(f) - min(f)) / 50), 1, 'hist');
hold on;
plot(E, dos / 2, 'r-', 'linewidth', 3);
xlabel('Energy (t)', 'fontsize', 15);
ylabel('DOS (1/t/atom)', 'fontsize', 15);
xlim([-E_max, E_max]);
set(gca,'fontsize',15,'ticklength',get(gca,'ticklength')*2);
legend('Diagonalization', 'Kernel polynomial');

