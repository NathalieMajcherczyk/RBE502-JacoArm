function [We] = JacobianW(q,dq)
%JACOBIANW
%    B = JACOBIANW(Q1,Q2,Q3,Q4,Q5,Q6)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    23-Apr-2017 14:55:34

q=num2cell(q);
[q1,q2,q3,q4,q5,q6]=deal(q{:});
%dq=num2cell(dq);
%[dq1,dq2,dq3,dq4,dq5,dq6]=deal(dq{:});

t2 = q1+q2;
t3 = sin(t2);
t4 = pi.*(1.1e1./3.6e1);
t5 = cos(t2);
t6 = q3+q4;
t7 = sin(t6);
t8 = sin(t4);
t9 = cos(t4);
t10 = cos(q5);
t11 = cos(t6);
t12 = sin(q5);
t13 = t5.*t8.*t11.*t12;
t14 = t5.*t8.*t10;
t15 = t3.*t8.*t11.*t12;
t16 = t14+t15-t3.*t7.*t9;
t17 = sin(q6);
t18 = cos(q6);
B = reshape([0.0,0.0,1.0,-t3,t5,0.0,-t3,t5,0.0,-t5.*t7,-t3.*t7,-t11,t13-t3.*t8.*t10-t5.*t7.*t9,t16,-t9.*t11-t7.*t8.*t12,-t9.*(-t13+t3.*t8.*t10+t5.*t7.*t9)+t8.*t18.*(t5.*t7.*t8-t3.*t9.*t10+t5.*t9.*t11.*t12)+t8.*t17.*(t3.*t12+t5.*t10.*t11),t9.*t16+t8.*t18.*(t3.*t7.*t8+t5.*t9.*t10+t3.*t9.*t11.*t12)-t8.*t17.*(t5.*t12-t3.*t10.*t11),-t9.*(t9.*t11+t7.*t8.*t12)+t8.*t18.*(t8.*t11-t7.*t9.*t12)-t7.*t8.*t10.*t17],[3,6]);
We=B*dq;