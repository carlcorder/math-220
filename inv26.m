% calculate the inverse of a square matrix modulo 26
% 26 factors as 2*13
function inv_A = inv26(A)

% size of A
n = length(A);

% Euler totient 26*(1-1/2)*(1-1/13)
phi = 12;

% determinant of A modulo 26
d = mod(det(A),26);

% multiplicative inverse modulo 26
inv_d = mod(d^(phi - 1),26);

% an nxn matrix A is invertible modulo n if and only if det(A) ~= 0(mod p)
% for every prime factor p of n
if(mod(det(A),2) ~= 0 & mod(det(A),13) ~= 0)

    % allocate memory for the cofactor matrix
    C = zeros(n,n);
    for i = 1:n% row
        for j = 1:n% column
            C(i,j) = (-1)^(i+j)*det([A([1:i-1],[1:j-1]) A([1:i-1],[j+1:n]);...
                                     A([i+1:n],[1:j-1]) A([i+1:n],[j+1:n])]);
        end   
    end
    
    % inverse is the cofactor transpose x multiplicative inverse of the
    % determinant
    inv_A = mod(inv_d .* transpose(C),26);
    
end
end