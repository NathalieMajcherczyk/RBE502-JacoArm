function dOe = PositionDerivative(q,dq)
%POSITIONDERIVATIVE
%    DOE = POSITIONDERIVATIVE(DQ1,DQ2,DQ3,DQ4,DQ5,Q1,Q2,Q3,Q4,Q5)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    23-Apr-2017 15:43:12

q=num2cell(q);
dq=num2cell(dq);
[q1,q2,q3,q4,q5,q6]=deal(q{:});
[dq1,dq2,dq3,dq4,dq5,dq6]=deal(dq{:});

t2 = q1+q2;
t3 = dq1+dq2;
t4 = cos(t2);
t5 = pi.*(1.1e1./7.2e1);
t6 = cos(t5);
t7 = sin(t2);
t8 = pi.*(1.1e1./3.6e1);
t9 = sin(t8);
t10 = cos(t8);
t11 = q3+q4;
t12 = cos(t11);
t13 = cos(q5);
t14 = sin(q5);
t15 = sin(t11);
t16 = dq3+dq4;
t17 = 1.0./t6;
t18 = cos(q3);
t19 = sin(q3);
t20 = t6.*3.374e3;
t21 = t20+7.43e2;
t22 = t6.*4.146e3;
t23 = t22+7.43e2;
t24 = sin(t5);
dOe = [t3.*t4.*(-9.8e-3)-t17.*t21.*(-dq5.*t7.*t9.*t14+t3.*t4.*t9.*t13-t3.*t7.*t10.*t15+t4.*t10.*t12.*t16-dq5.*t4.*t9.*t12.*t13+t3.*t7.*t9.*t12.*t14+t4.*t9.*t14.*t15.*t16).*5.0e-5-dq3.*t4.*t19.*(4.1e1./1.0e2)-t3.*t7.*t18.*(4.1e1./1.0e2)+t3.*t7.*t15.*t17.*7.43e-2-t3.*t4.*t17.*t23.*5.0e-5-t4.*t12.*t16.*t17.*7.43e-2;t3.*t7.*(-9.8e-3)-t17.*t21.*(dq5.*t4.*t9.*t14+t3.*t4.*t10.*t15+t3.*t7.*t9.*t13+t7.*t10.*t12.*t16-dq5.*t7.*t9.*t12.*t13-t3.*t4.*t9.*t12.*t14+t7.*t9.*t14.*t15.*t16).*5.0e-5-dq3.*t7.*t19.*(4.1e1./1.0e2)+t3.*t4.*t18.*(4.1e1./1.0e2)-t3.*t4.*t15.*t17.*7.43e-2-t3.*t7.*t17.*t23.*5.0e-5-t7.*t12.*t16.*t17.*7.43e-2;dq3.*t18.*(-4.1e1./1.0e2)-t17.*t21.*(-t15.*t16.*(t6.^2.*2.0-1.0)+dq5.*t6.*t13.*t15.*t24.*2.0+t6.*t12.*t14.*t16.*t24.*2.0).*5.0e-5+t15.*t16.*t17.*7.43e-2];
