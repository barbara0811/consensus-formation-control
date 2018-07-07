% clear;

n = 5; %number of agents
K = 0.05;%Gain
A = zeros(n,n);
G = zeros(n,n);
for i = 1:n
    for j = 1:n
        if i~=j
            A(i,j) = 1;
            G(i,j) = K;
        end
    end
end

% x0 = [0, -1, -1, -2, -2];
% y0 = [ 0, 1,-1, 2, -2];
 
x0 = [20, -10, -20, 10, -20];
y0 = [20, 10,0, -10, -20];


R1 = [0, -1, -1, -2, -2; 0, 1,-1, 2, -2]; %V-formation
R2 = [9, 7, 5 ,3, 1; 0,0,0,0,0];%I-formation



%ardrone_params
m = 1.65;  % kg
g = 9.81;  % m/s^2
T_roll = 0.4; % sec
T_pitch = 0.4; % sec
T_yaw = 0.8; % sec
T_z = 0.6; % sec
c_d = 2.5; % kg/s 

roll_max = 0.4;  % rad
pitch_max = 0.4;  % rad
yaw_rate_max = 0.7864;  % rad/s
z_rate_max = 0.7;  % m/s
