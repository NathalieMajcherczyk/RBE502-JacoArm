clear all
clc, close all
format shortg

%% Robot Length Values (meters)

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

%d2hmat(th5eta,d,a,alpha)

syms q1 q2 q3 q4 q5 q6;

% Link 1
T01=dh2mat(q1,D1,0,0);

% Link 2
T12=dh2mat(q2,0,0,sym(-pi/2));

% Link 3
T23=dh2mat(q3,e2,D2,sym(0)); 

% Link 4
T34=dh2mat(q4,d4b,0,sym(-pi/2));

% Link 5
T45=dh2mat(q5,d5b,0,2*aa);

% Link 6
T56=dh2mat(q6,d6b,0,2*aa);

T06=T01*T12*T23*T34*T45*T56;
%T06=simplify(T06);

%% Get hi(distance along the axis of g between mass center of each link and the original base frame)
% Relative mass center vectors
v1 = [0,-50.4,8,1];
v2 = [-200.9,0,19.54,1];
v3 = [0,-3.17,-74.88,1];
v4 = [0,10.26,-6.87,1];
v5 = [0,10.26,-6.87,1];
v6 = [-7.51,0.52,-108.22,1];
vector = [v1;v2;v3;v4;v5;v6];
for i = 1:length(vector)
   vector(i,1:3) = vector(i,1:3)/1000;
end
vector_new = sym(zeros(6,4)); 
% get the vector in the prvious frame
q = zeros(1,6);
T = eye(4);
% This part is for verification when q=0
D_H = [q(1),D1,0,0;q(2),0,0,-pi/2;q(3),e2,D2,0;q(4),d4b,0,-pi/2;q(5),d5b,0,2*aa;q(6),d6b,0,2*aa];
% D_H = [q(1),D1,0,pi/2;q(2),0,D2,pi;q(3),-e2,0,pi/2;q(4),-d4b,0,2*aa;q(5),-d5b,0,2*aa;q(6),d6b,0,pi]
for i = 1:6
    t = dh2mat(D_H(i,1),D_H(i,2),D_H(i,3),D_H(i,4));
    T = T*t
    vector_new(i,:) = T*vector(i,:)'
end
vector_new = [0,0,0,1;vector_new];
hi = vector_new(1:end,3)
plotarm(q(1),q(2),q(3),q(4),q(5),q(6))

% This part is for symbolic expression of the hi
% Probably work
syms q1 q2 q3 q4 q5 q6;
T_sym = eye(4);
vector_new1 = sym(zeros(6,4));
D_H = [q1,D1,0,sym(pi/2);q2,0,D2,pi;q3,-e2,0,sym(pi/2);q4,-d4b,0,2*aa;q5,-d5b,0,2*aa;q6,d6b,0,sym(pi)]
for i = 1:length(vector)
    t = dh2mat(D_H(i,1),D_H(i,2),D_H(i,3),D_H(i,4));
    T_sym = T_sym*t
    vector_new1(i,:) = T_sym*vector(i,:)'
end
simplify(vector_new)
%% Gravity Compensation Torques

g=9.81; %kgm/s^2
% Motor mass kg
m1=0.64; 
m2=0.64;
m3=0.64;
m4=0.39;
m5=0.39;
m6=0.39;
mh = 0.93;
% Link mass kg
shoulder = 0.182;
arm = 0.424;
forearm = 0.211;
wrist = 0.069;
hands = 0.948;
% mass of each fram
mi = zeros(6,1);
mi(1) = .5*m1 + .5*m2 + shoulder;
mi(2) = .5*m2 + .5*m3 + arm;
mi(3) = .5*m3 + .5*m4 + forearm;
mi(4) = .5*m4 + .5*m5 + wrist;
mi(5) = .5*m5 + .5*m6 + wrist;
mi(6) = .5*m6 + mh + hands;
% calculate the potential energy of the arm
syms q1 q2 q3 q4 q5 q6;
P = g*sum(mi.*vector_new1(:,3))
torque(1,:) = diff(P,q1);
torque(2,:) = diff(P,q2);
torque(3,:) = diff(P,q3);
torque(4,:) = diff(P,q4);
torque(5,:) = diff(P,q5);
torque(6,:) = diff(P,q6);

g =matlabFunction(torque,'File','gravity');
