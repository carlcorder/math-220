%% Hill Substitution Ciphers
% http://planetcalc.com/3324/

% 1.
n = 26;
% a)
mod(17 + 24,n)% 15

% b)
mod(20*5,n)% 22

% c)
x = 7 .* [4; 12; 21] - 3 .* [14; 5; 16];
mod(x,n)% [12; 17; 21]

% d)
A = [11 22 14;
      7  9 21;
     17  0  3];

B = [ 3 10 20;
     20  9 17;
      9  4 17];
  
mod(A*B,n)% 3x3 identity matrix

% 2.

% encode the message (padded with random letter)
% BUY TEN SHA RES TOM ORR OWX -> (7x3)
M = [1 19 18 17 19 14 14;
    20  4  7  4 14 17 22;
    24 13  0 18 12 17 23];

key = [ 3 10 20;
       20  9 17;
        9  4 17];
    
C = mod(key * M,n)

%   7    19    20     9    21     6    20
%  10    13     7     6     8    20    11
%   3    18     8     7    15    15     7

% HKD TNS UHI JGH VIP GUP ULH

% 3. 

% decode the phrase
% KSK BHX KDY RVT KRZ TQE -> (6x3)
C = [10  1 10 17 10 19;
     18  7  3 21 17 16;
     10 23 24 19 25  4];

inv_key = [11 22 14;
            7  9 21;
           17  0  3];
       
message = mod(inv_key * C,n)

%     22    19    18     5     2    19
%      0     7     3     5    20    23
%     18     8     8     8    11    23


% WAS THI SDI FFI CUL TXX