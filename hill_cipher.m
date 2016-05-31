% Hill cipher of message M
function cipher = hill_cipher(M,action)
X = 23; % ascii character encoding (88) - 65
encode = 'e';
decode = 'd';

lock = [ 3 10 20;
       20  9 17;
        9  4 17];

% inverse of lock modulo 26
unlock = [11 22 14;
           7  9 21;
          17  0  3];

% convert the input
M = upper(M);% convert to upper case
M = M(M >= 65 & M <= 90);% filter non alphabetic
nM = double(M);% convert to numeric array
nM = nM - 65;% shift to [0 - 25]

% pad with X if necessary
n = length(nM);
if(mod(n,3) == 1)
    nM = [nM X X];
    n = n + 2;
elseif(mod(n,3) == 2)
    nM = [nM X];
    n = n + 1;    
end

% groups of three
nM = reshape(nM,3,n/3);

% encode or decode based on the action flag
if(strcmp(action,encode))
    cipher = mod(lock * nM,26);% encode and re mod
elseif(strcmp(action,decode))
    cipher = mod(unlock * nM,26)% decode and re mod
else
    fprintf('failed to %s',action);
end

cipher = reshape(cipher,1,n);
cipher = cipher + 65;% rescale to ascii
cipher = char(cipher);% convert to char array

end