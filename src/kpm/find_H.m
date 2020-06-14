function H = find_H(Nx, Ny, W)
N = Nx * Ny; % number of atoms
% The following data will be used to construct the sparse matrix H
row = zeros(N * 4, 1);
col = zeros(N * 4, 1);
Hij = -ones(N * 4, 1);
count = 0;
for nx = 0 : Nx - 1
    for ny = 0 : Ny - 1
        % The center atom
        index_center = find_index(nx, ny, Ny);
        % The left neighboring atom:
        index_left = find_index(mod(nx - 1, Nx), ny, Ny);
        count = count + 1;
        row(count) = index_center;
        col(count) = index_left;
        % The right neighboring atom:
        index_right  = find_index(mod(nx + 1, Nx), ny, Ny);
        count = count + 1;
        row(count) = index_center;
        col(count) = index_right;
        % The up neighboring atom:
        index_up = find_index(nx, mod(ny + 1, Ny), Ny);
        count = count + 1;
        row(count) = index_center;
        col(count) = index_up;
        % The down neighboring atom:
        index_down = find_index(nx, mod(ny - 1, Ny), Ny);
        count = count + 1;
        row(count) = index_center;
        col(count) = index_down;
    end
end
H = sparse(row, col, Hij, N, N, N * 4); % hopping
U = sparse(1 : N, 1 : N, (rand(N, 1) - 0.5) * W, N, N, N); % Anderson disorder
H = H + U;
end % end of the function find_H

% A function called by find_H
function [index] = find_index(nx, ny, Ny)
index = nx * Ny + ny + 1;
end
