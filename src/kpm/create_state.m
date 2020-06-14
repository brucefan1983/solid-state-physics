function initial_state = create_state(N)
random_phase = rand(N, 1) * 2 * pi;
initial_state = cos(random_phase) + sin(random_phase) * 1i;   
initial_state = initial_state / norm(initial_state); % length = 1
