close all
load('results5.mat')

% q1=q.Data(:,1);
% q2=q.Data(:,2);
% q3=q.Data(:,3);
% q4=q.Data(:,4);
% q5=q.Data(:,5);
% q6=q.Data(:,6);
% step=1;%00;
% tf=length(q.Data(:,1));%-84;
% n=tf/step;
% X=zeros(n,7);
% Y=zeros(n,7);
% Z=zeros(n,7);
% for i=1:n
% [X(i,:),Y(i,:),Z(i,:)]=plotarm(q1(i*step),q2(i*step),q3(i*step),q4(i*step),q5(i*step),q6(i*step));
% end
% 
% save('joints5.mat','X','Y','Z');

load('joints5.mat')
step=1;
figure
F1(1,length(X)) = struct('cdata',[],'colormap',[]);
for i=1:length(X)
plot3(xd.Data(:,1),xd.Data(:,2),xd.Data(:,3),'g-')
hold on
plot3(xe.Data(:,1),xe.Data(:,2),xe.Data(:,3),'k-')
hold on
plot3(xd.Data(i*step,1),xd.Data(i*step,2),xd.Data(i*step,3),'g*')
hold on
plot3(xe.Data(i*step,1),xe.Data(i*step,2),xe.Data(i*step,3),'k*')
hold on
plot3(X(i,:),Y(i,:),Z(i,:),'b-')%,'linewidth',3)
hold on
plot3(X(i,:),Y(i,:),Z(i,:),'r*')%,'markersize')
hold on
F1(i) = getframe;
pause(0.05)
axis([-0.3 0.3 -0.3 0.3 0 1.2])
hold off
end

save('frames_5.mat','F1');
v = VideoWriter('video_5.avi');
v.FrameRate=100;
open(v);
writeVideo(v,F1);
close(v);

figure (2)
subplot(6,1,1)
plot(xd.Time,xd.Data(:,1),'b');
hold on
plot(xe.Time,xe.Data(:,1),'r');
ylabel('x (m)','FontSize',14)  
subplot(6,1,2)
plot(xd.Time,xd.Data(:,2),'b');
hold on
plot(xe.Time,xe.Data(:,2),'r');
ylabel('y (m)','FontSize',14)  
subplot(6,1,3)
plot(xd.Time,xd.Data(:,3),'b');
hold on
plot(xe.Time,xe.Data(:,3),'r');
ylabel('z (m)','FontSize',14) 
subplot(6,1,4)
plot(xd.Time,xd.Data(:,4),'b');
hold on
plot(xe.Time,xe.Data(:,4),'r');
ylabel('roll (rad)','FontSize',14) 
subplot(6,1,5)
plot(xd.Time,xd.Data(:,5),'b');
hold on
plot(xe.Time,xe.Data(:,5),'r');
ylabel('pitch (rad)','FontSize',14) 
subplot(6,1,6)
plot(xd.Time,xd.Data(:,6),'b');
hold on
plot(xe.Time,xe.Data(:,6),'r');
ylabel('yaw (rad)','FontSize',14) 
xlabel('time (s)','FontSize',14) 

figure(3)
subplot(6,1,1)
plot(torques.Time(100:end),torques.Data(100:end,1),'b');
ylabel('$\tau_1$ (Nm)','Interpreter','latex','FontSize',14)
subplot(6,1,2)
plot(torques.Time(100:end),torques.Data(100:end,2),'b');
ylabel('$\tau_2$ (Nm)','Interpreter','latex','FontSize',14)
subplot(6,1,3)
plot(torques.Time(100:end),torques.Data(100:end,3),'b');
ylabel('$\tau_3$ (Nm)','Interpreter','latex','FontSize',14)
subplot(6,1,4)
plot(torques.Time(100:end),torques.Data(100:end,4),'b');
ylabel('$\tau_4$ (Nm)','Interpreter','latex','FontSize',14)
subplot(6,1,5)
plot(torques.Time(100:end),torques.Data(100:end,5),'b');
ylabel('$\tau_5$ (Nm)','Interpreter','latex','FontSize',14)
subplot(6,1,6)
plot(torques.Time(100:end),torques.Data(100:end,6),'b');
ylabel('$\tau_6$ (Nm)','Interpreter','latex','FontSize',14)
xlabel('time (s)','FontSize',14)

