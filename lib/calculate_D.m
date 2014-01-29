function D = calculate_D(incident_angle)
%   D = calculate_D(incident_angle)
%   Calculate coefficient D in the Bloch transfer matrix

	declare_parameters

	z_hat_one = cos(asin(sin(incident_angle)/refractive_index_of_first_layer));
	z_hat_two = cos(asin(sin(incident_angle)/refractive_index_of_second_layer));
	k_one = incident_wavevector*refractive_index_of_first_layer*z_hat_one;
	k_two = incident_wavevector*refractive_index_of_second_layer*z_hat_two;

	if polarization == 'TE' || polarization == 'S'
		fraction_sum = (k_two/k_one) + (k_one/k_two);
	elseif polarization == 'TM' || polarization == 'P'
		n_one_squared = calculate_n_squared(refractive_index_of_first_layer);
		n_two_squared = calculate_n_squared(refractive_index_of_second_layer);
		k_fraction = (n_one_squared*k_two)/(n_two_squared*k_one);
		fraction_sum = k_fraction + 1/k_fraction;
	end
	
	exponent = exp(-1i*k_one*thickness_of_first_layer);
	cosine_term = cos(k_two*thickness_of_second_layer);
	sine_term = -(1i/2)*sin(k_two*thickness_of_second_layer)*fraction_sum;
	
	D = exponent*(cosine_term + sine_term);

end