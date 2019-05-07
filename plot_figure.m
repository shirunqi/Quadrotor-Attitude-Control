clc
clear all
close all

load Data_save.mat
load times.mat

t = times;
x = Data_save(1:3,:);
xdot = Data_save(4:6,:);
angles = Data_save(7:9,:);
anglesdot = Data_save(10:12,:);

figure(1)
plot3(x(1,:),x(2,:),x(3,:));
xlabel('时间(s)');
ylabel('位置(m)');
title('位置变化曲线');
grid on

figure(2)
plot(t,xdot(1,:),t,xdot(2,:),t,xdot(3,:));
grid on

figure(3)
plot(t,anglesdot(1,:),'-',t,anglesdot(2,:),':',t,anglesdot(3,:),'-.','linewidth',2);
xlabel('时间(s)');
ylabel('角速度(rad/s)');
title('角速度随时间变化');
h = legend('$$\dot{\phi}$$','$$\dot{\theta}$$','$$\dot{\psi}$$');
set(h,'Interpreter','latex');
grid on

figure(4)
plot(t,angles(1,:),'-',t,angles(2,:),':',t,angles(3,:),'-.','linewidth',2);
xlabel('时间(s)');
ylabel('角度(rad)');
title('姿态角随时间变化');
legend('\phi','\theta','\psi');
grid on

figure(5)
plot(t,x(3,:));
grid on
title('高度控制');