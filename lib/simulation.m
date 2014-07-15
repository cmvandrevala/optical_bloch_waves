clear all
clf

declare_parameters

incident_angle_values = zeros(number_of_data_points(theta_step));
t_values = zeros(number_of_data_points(theta_step));
r_values = zeros(number_of_data_points(theta_step));
T_values = zeros(number_of_data_points(theta_step));
R_values = zeros(number_of_data_points(theta_step));

for count = 1:number_of_data_points(theta_step)
    
	A = calculate_A(theta_step*count);
	B = calculate_B(theta_step*count);
	C = calculate_C(theta_step*count);
	D = calculate_D(theta_step*count);
	transfer_matrix = chebyshev_equality([A B; C D]);
    
	incident_angle_values(count) = theta_step*count;
    
	r_values(count) = transfer_matrix(2,1)/transfer_matrix(1,1);
	t_values(count) = 1/transfer_matrix(1,1);
	R_values(count) = conj(r_values(count))*r_values(count);
	T_values(count) = conj(t_values(count))*t_values(count);

end

[Y,Indx] = max(T_values);
maximal_angle = incident_angle_values(Indx)*180/pi;
disp(maximal_angle(1))

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

