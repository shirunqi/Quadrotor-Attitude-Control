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
%% ��ʵ֤����ѭ����ʱ��ʱ���ƽ����簴�����ƽ�����
% ���õķ�ʽ�Ǽ���times�ĸ�����N = numel(times)
% �����������Ҳ���Խ�Data_Save���ڴ���ǰ���з��䣬��Data_Save = zeros(16,N);
for t = times
    
    
    %i = input_wi(t); % ��ת��ƽ����Ϊ����
    %PD_controller
%     i = PD_controller(anglesdot,dt);
    %% ��̬������
    i = PID_controller(anglesdot,dt);
    
    % ����ŷ���Ǽ��䵼���ĳ�ʼֵ������ٶȣ��ⲽ����Ϊ���ʼ��Ҳ�ǿ��Եģ�
    % �õ�ѭ��֮�⣬����˽��ٶȵĳ�ֵ���ɣ���������ѭ�����Լ��ƽ�������
    % ��Ҫ��ȷ��ŷ���ǵĵ����ͽ��ٶȲ���ͬһ��������Щ��������С�Ƕ������˼򻯼��裬����Ϊ��һ���ģ�����Ҳʹ����̬����ѧ���̱�ü�
    omega = anglesdot2omega(anglesdot,angles);
    
    %
    a = acceleration(i,angles,xdot);
    xdot = xdot + dt * a;
    x = x + dt * xdot;
    
    %
    omegadot = angular_acceleration(i,omega);
    omega = omega + dt * omegadot;
    % Ϊ�˸���ŷ���ǣ���Ҫ����ŷ���ǵĵ���
    anglesdot = omega2anglesdot(omega,angles);
    angles = angles + dt * anglesdot;
 
    Data_save(:,count) = [x;xdot;angles;anglesdot;i];
    count = count + 1;
    
end

save Data_save;
save times;

plot_figure;