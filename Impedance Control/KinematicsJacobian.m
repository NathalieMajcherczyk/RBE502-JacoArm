clear
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

q=[q1;q2;q3;q4;q5;q6];

% Link 1
T01=dh2mat(q1,D1,0,sym(pi/2));

% Link 2
T12=dh2mat(q2,0,D2,sym(pi));

% Link 3
T23=dh2mat(q3,-e2,0,sym(pi/2)); 

% Link 4
T34=dh2mat(q4,-d4b,0,2*aa);

% Link 5
T45=dh2mat(q5,-d5b,0,2*aa);

% Link 6
T56=dh2mat(q6,-d6b,0,sym(pi));

T06=T01*T12*T23*T34*T45*T56;
T06=simplify(T06);
T06=eval(T06);

Re=T06(1:3,1:3);
Oe=T06(1:3,4);
%matlabFunction(Re,Oe,'File','ForwardKinematics');

% Computation of B

approach_vector_0=T01(1:3,3);

T02=T01*T12;
approach_vector_1=T02(1:3,3);

T03=T02*T23;
approach_vector_2=T03(1:3,3);

T04=T03*T34;
approach_vector_3=T04(1:3,3);

T05=T04*T45;
approach_vector_4=T05(1:3,3);

approach_vector_5=T06(1:3,3);

B=[approach_vector_0, approach_vector_1, approach_vector_2,approach_vector_3, approach_vector_4, approach_vector_5]

% Computation of A (3 DoF form of the Jacobian)

A=[diff(T06(1:3,4),q1),diff(T06(1:3,4),q2),diff(T06(1:3,4),q3),diff(T06(1:3,4),q4),diff(T06(1:3,4),q5),diff(T06(1:3,4),q6)];

% Full 6DoF Jacobian
J=[A;B]
%matlabFunction(B,'File','B');
%matlabFunction(J,'File','J');

q_char=['q1';'q2';'q3';'q4';'q5';'q6'];
dq_char=['dq1';'dq2';'dq3';'dq4';'dq5';'dq6'];

phie=[atan2(T06(2,1),T06(1,1));atan2(-T06(3,1),sqrt(T06(3,2)^2+T06(3,3)^2));atan2(T06(3,2),T06(3,3))];
pe=T06(1:3,4);

xe=[pe;phie];

dphie=sym(zeros(3,6));
dpe=sym(zeros(3,6));

for i=1:6
    dpe(:,i)=diff(pe,q(i));
    dphie(:,i)=diff(phie,q(i));
end

JA=[dpe;dphie];

syms t q1(t) q2(t) q3(t) q4(t) q5(t) q6(t);

q1=q1(t);
q2=q2(t);
q3=q3(t);
q4=q4(t);
q5=q5(t);
q6=q6(t);

%q=[q1(t);q2(t);q3(t);q4(t);q5(t);q6(t)];

dq=[diff(q1,t);
    diff(q2,t);
	diff(q3,t);
    diff(q4,t);
    diff(q5,t);
    diff(q6,t)];

dpe=subs(dpe);
dphie=subs(dphie);

% for i=1:6
%     dpe=subs(dpe,q(i),q_char(i,:));
%     dphie=subs(dphie,q(i),q_char(i,:));
% end
% 
dpe=simplify(dpe)
% dphie=simplify(dphie)

JAf=[dpe;dphie]
%matlabFunction(JA,'File','JA');
JA_dot=diff(JAf,t);
for i=1:6
    JA_dot=subs(JA_dot,dq(i),dq_char(i,:));
end
JA_dot=subs(JA_dot,q1,q_char(1,:));
JA_dot=subs(JA_dot,q2,q_char(2,:));
JA_dot=subs(JA_dot,q3,q_char(3,:));
JA_dot=subs(JA_dot,q4,q_char(4,:));
JA_dot=subs(JA_dot,q5,q_char(5,:));
JA_dot=subs(JA_dot,q6,q_char(6,:));
matlabFunction(JA_dot,'File','JA_dot','Optimize',false);
