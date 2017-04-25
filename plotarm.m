function [ X,Y,Z ] = plotarm( q1, q2, q3, q4, q5, q6)
%PLOTARM plot ABB robot arm
%  This function will solve the forward kinematics and draw each link in
%  a 3D plot based upon an input vector of the joint angle configuration.
% 

D1=0.2755;
D2=0.41;
D3=0.2073;
D4=0.0743;
D5=0.0743;
D6=0.1687;
e2=0.0098;
aa=sym((11*pi/72));
ca=cos(aa);
sa=sin(aa);
c2a=cos(2*aa);
s2a=sin(2*aa);
d4b=D3+sa/s2a*D4;
d5b=sa/s2a*D4+sa/s2a*D5;
d6b=sa/s2a*D5+D6;

% Link 1
T01=dh2mat(q1,D1,0,pi/2);

% Link 2
T12=dh2mat(q2,0,D2,pi);

% Link 3
T23=dh2mat(q3,-e2,0,pi/2); 

% Link 4
T34=dh2mat(q4,-d4b,0,2*aa);

% Link 5
T45=dh2mat(q5,-d5b,0,2*aa);

% Link 6
T56=dh2mat(q6,-d6b,0,pi);


T06=T01*T12*T23*T34*T45*T56;

joint1=T01;
joint2=joint1*T12;
joint3=joint2*T23;
joint4=joint3*T34;
joint5=joint4*T45;
joint6=joint5*T56;

X=[0 joint1(1,4) joint2(1,4) joint3(1,4) joint4(1,4) joint5(1,4) joint6(1,4)];
Y=[0 joint1(2,4) joint2(2,4) joint3(2,4) joint4(2,4) joint5(2,4) joint6(2,4)];
Z=[0 joint1(3,4) joint2(3,4) joint3(3,4) joint4(3,4) joint5(3,4) joint6(3,4)];

%figure
%plot3(X,Y,Z,'b-','linewidth',3)
%hold on;
%plot3(X,Y,Z,'r.','markersize',30)
% xlabel('X(mm)','fontsize',14)
% ylabel('Y(mm)','fontsize',14)
% zlabel('Z(mm)','fontsize',14)
% title('Arm Display')
% grid on
%T=joint6;

end

