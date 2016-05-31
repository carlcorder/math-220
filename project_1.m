%% Equilibrium Temperature Distribution

% degree matrix
D = 4.*eye(4);

% adjacency marix
A = [0 1 1 0;
     1 0 0 1;
     1 0 0 1;
     0 1 1 0];
 
% laplace matrix
L = D - A;

% implicit boundary conditions
b1 = [40; 30; 30; 20];

% solve by backslash
x1 = L\b1;

% 1. solve by row reduction
rref_L = rref([L b1]);

% solve by inverse
inverse_L = inv(L);

% 2. show results for L,L^-1 & x
display(L);
display(rref_L);
display(inverse_L);
display(x1);

% 3. if the external temperature of the top plate changes to 50, the
% boundary conditions become
b2 = [60; 50; 30; 20];

x2 = L\b2;
display(x2);

