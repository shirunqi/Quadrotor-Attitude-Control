clc
clear all
close all

global Data_save;
%%
parameters;
%%
start_time = 0;
end_time = 4;
dt = 0.005;
times = start_time : dt : end_time;

%%
x = [0;0;10];
xdot = zeros(3,1);
angles = zeros(3,1);

% anglesdot = zeros(3,1);
deviation = 300;
anglesdot = deg2rad(2 * deviation * rand(3,1) - deviation);

count = 1;
%% 事实证明，循环的时候按时间推进不如按次数推进方便
% 更好的方式是计算times的个数，N = numel(times)
% ，有了这个，也可以将Data_Save的内存提前进行分配，即Data_Save = zeros(16,N);
for t = times
    
    
    %i = input_wi(t); % 以转速平方作为输入
    %PD_controller
%     i = PD_controller(anglesdot,dt);
    %% 姿态控制器
    i = PID_controller(anglesdot,dt);
    
    % 根据欧拉角及其导数的初始值计算角速度，这步我认为在最开始有也是可以的，
    % 拿到循环之外，获得了角速度的初值即可，接下来的循环就自己推进就行了
    % 需要明确：欧拉角的导数和角速度不是同一个量，有些文献中在小角度下作了简化假设，才认为是一样的，那样也使得姿态动力学方程变得简单
    omega = anglesdot2omega(anglesdot,angles);
    
    %
    a = acceleration(i,angles,xdot);
    xdot = xdot + dt * a;
    x = x + dt * xdot;
    
    %
    omegadot = angular_acceleration(i,omega);
    omega = omega + dt * omegadot;
    % 为了更新欧拉角，需要计算欧拉角的导数
    anglesdot = omega2anglesdot(omega,angles);
    angles = angles + dt * anglesdot;
 
    Data_save(:,count) = [x;xdot;angles;anglesdot;i];
    count = count + 1;
    
end

save Data_save;
save times;

plot_figure;