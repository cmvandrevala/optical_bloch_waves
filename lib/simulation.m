clear all
clf

declare_parameters
N = calculate_number_of_data_points(theta_step);

% Define Matrices and Vectors
incident_angle_values = zeros(N);
t_values = zeros(N);
r_values = zeros(N);
T_values = zeros(N);
R_values = zeros(N);

% Run Simulation

for count = 0:N-1

	incident_angle = theta_step*count;
	incident_angle_values(count+1) = incident_angle;

	A = calculate_A(incident_angle);
	B = calculate_B(incident_angle);
	C = calculate_C(incident_angle);
	D = calculate_D(incident_angle);

	bloch_matrix = [A B; C D];
	transfer_matrix = chebyshev_equality(bloch_matrix, number_of_layers);

	r_values(count+1) = transfer_matrix(2,1)/transfer_matrix(1,1);
	t_values(count+1) = 1/transfer_matrix(1,1);
	R_values(count+1) = conj(r_values(count+1))*r_values(count+1);
	T_values(count+1) = conj(t_values(count+1))*t_values(count+1);

end

[Y,Indx] = max(T_values);
maximal_angle = incident_angle_values(Indx)*180/pi;
maximal_angle = maximal_angle(1)

subplot(3,2,1);
plot(incident_angle_values, real(t_values))
title('real(t) vs. Incident Angle')
xlabel('Incident Angle (rad)')
ylabel('real(t)')

subplot(3,2,2);
plot(incident_angle_values, real(r_values))
title('real(r) vs. Incident Angle')
xlabel('Incident Angle (rad)')
ylabel('real(r)')

subplot(3,2,3);
plot(incident_angle_values, imag(t_values))
title('imag(t) vs. Incident Angle')
xlabel('Incident Angle (rad)')
ylabel('imag(t)')

subplot(3,2,4)
plot(incident_angle_values, imag(r_values))
title('imag(r) vs. Incident Angle')
xlabel('Incident Angle (rad)')
ylabel('imag(r)')

subplot(3,2,5)
plot(incident_angle_values,T_values)
title('T vs. Incident Angle')
xlabel('Incident Angle (rad)')
ylabel('T')

subplot(3,2,6);
plot(incident_angle_values,R_values)
title('R vs. Incident Angle')
xlabel('Incident Angle (rad)')
ylabel('R')

