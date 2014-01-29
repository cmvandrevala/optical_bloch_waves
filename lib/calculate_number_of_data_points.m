function N = calculate_number_of_data_points(theta_step)
%	N = calculate_number_of_data_points(theta_step)
%	Calculate the total number of data points for a simulation
	
	N = floor((pi/2)/theta_step + 1);
	
end