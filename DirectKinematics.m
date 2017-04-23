function [ Oe, Re ] = DirectKinematics(q)
%DIRECTKINEMATICS 

q=num2cell(q);
[q1,q2,q3,q4,q5,q6]=deal(q{:});

%% Robot Length Values (meters)

D1=0.2755;
D2=0.41;
D3=0.2073;
D4=0.0743;
D5=0.0743;
D6=0.1687;
e2=0.0098;
aa=double(11*pi/72);
ca=cos(aa);
sa=sin(aa);
c2a=cos(2*aa);
s2a=sin(2*aa);
d4b=D3+sa/s2a*D4;
d5b=sa/s2a*D4+sa/s2a*D5;
d6b=sa/s2a*D5+D6;

% Link 1
T01=dh2mat(q1,D1,0,0);

% Link 2
T12=dh2mat(q2,0,0,-pi/2);

% Link 3
T23=dh2mat(q3,e2,D2,0); 

% Link 4
T34=dh2mat(q4,d4b,0,-pi/2);

% Link 5
T45=dh2mat(q5,d5b,0,2*aa);

% Link 6
T56=dh2mat(q6,d6b,0,2*aa);

T06=T01*T12*T23*T34*T45*T56;
Re=T06(1:3,1:3);
Oe=T06(1:3,4);

end

