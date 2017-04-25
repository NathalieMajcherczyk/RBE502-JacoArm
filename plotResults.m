close all
load('results3.mat')

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
% save('joints3.mat','X','Y','Z');

load('joints3.mat')
figure
for i=1:n
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
pause(0.05)
hold off
end