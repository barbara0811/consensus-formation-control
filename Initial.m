clear;

% A = [0 1 1 1 ; 1 0 1 1; 1 1 0 1; 1 1 1 0];
% 
% x0 = [0, 30, 10, 60];
% y0 = [30, 60, 50, 40];
% 
R = [1, -1, -1, 1; -1, -1, 1, 1];
R2 = [0,0,0,0; -1, 1, -3, 3];

A = [0 1 1 1; 
    1 1 1 1 ; 
    1 1 0 1;
    1 1 1 0]; 

G = [0 0.05 0.05 0.05 ; 
    0.05 0 0.05 0.05 ; 
    0.05 0.05 0 0.05;
    0.05 0.05 0.05 0]; 
   

D = [1,1,1,1,1,1];

x0 = [20, 60, 30, 50];
y0 = [60, 20, 50, 30];

%R = [0, 0,0 ; 0, 0, 0 ];

vxd = -1;
vyd = -1;
ax = 1;
ay = 1;
