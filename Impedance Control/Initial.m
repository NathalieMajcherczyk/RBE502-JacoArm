%% Before running this script:
% Run the basic launch file (without controllers) from Jennifer's Package
%
% roslaunch jaco_on_table jaco_on_table_gazebo.launch
% 
% A Gazebo model of JACO Arm should launch without any errors, and without
% any controllers. The Arm would be hanging freely from the table.
%
% Now in MATLAB
% Clear all close all, and close any existing ROS instances
 clc, clear, close all
 rosshutdown;
 %% Initialize Kp and Kd
Kp=2500*eye(6);
Kd=500*eye(6);
Md=100*eye(6);
Md_inv=inv(Md);

