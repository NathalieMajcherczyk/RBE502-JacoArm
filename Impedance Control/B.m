function B = B(q1,q2,q3,q4,q5)
%B
%    B = B(Q1,Q2,Q3,Q4,Q5)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    01-May-2017 13:22:21

t2 = sin(q1);
t3 = cos(q1);
t4 = cos(q2);
t5 = sin(q3);
t6 = t3.*t4.*t5;
t7 = cos(q3);
t8 = sin(q2);
t13 = t3.*t7.*t8;
t9 = t6-t13;
t10 = pi.*(1.1e1./3.6e1);
t11 = sin(t10);
t12 = cos(t10);
t14 = t9.*t12;
t15 = cos(q4);
t16 = t2.*t11.*t15;
t17 = sin(q4);
t18 = t3.*t4.*t7;
t19 = t3.*t5.*t8;
t20 = t18+t19;
t21 = t11.*t17.*t20;
t22 = t14+t16+t21;
t23 = q2-q3;
t24 = sin(q5);
t25 = t2.*t17;
t26 = cos(q5);
t27 = t2.*t12.*t15;
t28 = sin(t23);
t29 = cos(t23);
t30 = t2.*t4.*t5;
t32 = t2.*t7.*t8;
t31 = t30-t32;
t33 = t12.*t31;
t34 = t2.*t5.*t8;
t35 = t2.*t4.*t7;
t36 = t34+t35;
t37 = t11.*t17.*t36;
t39 = t3.*t11.*t15;
t38 = t33+t37-t39;
t40 = t3.*t17;
t41 = t3.*t12.*t15;
t42 = t4.*t7;
t43 = t5.*t8;
t44 = t42+t43;
t45 = t12.*t44;
t46 = t4.*t5;
t49 = t7.*t8;
t47 = t46-t49;
t48 = t45-t11.*t17.*t47;
B = reshape([t2,-t3,0.0,-t2,t3,0.0,t9,t31,t44,t22,t38,t48,t12.*t22+t11.*t26.*(t27-t9.*t11+t12.*t17.*t20)-t11.*t24.*(t25-t15.*t20),t12.*t38-t11.*t26.*(t41+t11.*t31-t12.*t17.*t36)+t11.*t24.*(t40+t15.*t36),t12.*t48-t11.*t26.*(t11.*t44+t12.*t17.*t47)-t11.*t15.*t24.*t47,-t12.*(t16-t3.*t12.*t28+t3.*t11.*t17.*t29)-t11.*t26.*(t27+t3.*t11.*t28+t3.*t12.*t17.*t29)-t11.*t24.*(-t25+t3.*t4.*t7.*t15+t3.*t5.*t8.*t15),t12.*(t39+t2.*t12.*t28-t2.*t11.*t17.*t29)-t11.*t26.*(-t41+t2.*t11.*t28+t2.*t12.*t17.*t29)-t11.*t24.*(t40+t2.*t4.*t7.*t15+t2.*t5.*t8.*t15),-t12.*(t12.*t29+t11.*t17.*t28)+t11.*t26.*(t11.*t29-t12.*t17.*t28)-t11.*t15.*t24.*t28],[3,6]);