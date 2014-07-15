function chebyshev_matrix = chebyshev_equality(transfer_matrix)
%   chebyshev_matrix = chebyshev_equality(transfer_matrix, number_of_layers)
%   Calculate the total transfer matrix of a system using the Chebyshev identity
%   transfer_matrix is the transfer matrix of a single unit cell
%   number_of_layers is the number of layers of the material

declare_parameters

A = transfer_matrix(1,1);
B = transfer_matrix(1,2);
C = transfer_matrix(2,1);
D = transfer_matrix(2,2);
N = number_of_layers;

argument = (A+D)/2;
K_Lambda = acos(argument);

A_prime = (A*sin(N*K_Lambda) - sin((N-1)*K_Lambda))/sin(K_Lambda);
B_prime = B*sin(N*K_Lambda)/sin(K_Lambda);
C_prime = C*sin(N*K_Lambda)/sin(K_Lambda);
D_prime = (D*sin(N*K_Lambda) - sin((N-1)*K_Lambda))/sin(K_Lambda);

chebyshev_matrix = [A_prime B_prime; C_prime D_prime];

end

