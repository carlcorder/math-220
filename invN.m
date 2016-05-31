% calculate the inverse of a square matrix A modulo N
function inv_A = invN(A,N)

% size of A
n = length(A);

% determinant of A
dA = det(A);
if(abs(dA) < 1e-3)
   display('singular matrix');
   return;
end

% Euler totient -> positive integers less than and relatively prime to N
% prime factors of N
p = factor(N);
f = @(x) (1 - 1./x);
phi = N * prod(arrayfun(@(x) f(x),p));

% determinant of A modulo N
d = mod(dA,N);

% multiplicative inverse modulo N
inv_d = mod(d^(phi - 1),N);

% an nxn matrix A is invertible modulo n if and only if det(A) ~= 0(mod p)
% for every prime factor p of n
div = @(x,y) (mod(x,y) == 0);
pass = sum(arrayfun(@(x,y) div(x,y),dA * ones(1,length(p)),p)) < 1;

if(pass)
    % allocate memory for the cofactor matrix
    C = zeros(n,n);
    
    for i = 1:n% row
        for j = 1:n% column
            C(i,j) = (-1)^(i+j)*det([A([1:i-1],[1:j-1]) A([1:i-1],[j+1:n]);...
                                     A([i+1:n],[1:j-1]) A([i+1:n],[j+1:n])]);
        end   
    end
    
    % inverse is the cofactor transpose x multiplicative inverse of the
    % determinant modulo N
    inv_A = mod(inv_d .* transpose(C),N);
end

end