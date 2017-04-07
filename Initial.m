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
Kp=100*eye(6);
Kd=50*eye(6);


%% Initialize ROS from MATLAB, using your username
rosinit('miems', 11311)      % please put your username here, 
                                % which you have on your computer

%% Run the Gazebo Handler from MATLAB
gazebo = ExampleHelperGazeboCommunicator();

%% Import the models (which were already spawned in Gazebo) into MATLAB
models = getSpawnedModels(gazebo)

%% Separate the JACO related model
jaco = ExampleHelperGazeboSpawnedModel('jaco_on_table',gazebo)

%% Seprate the components of JACO into links and joints
[links, joints] = getComponents(jaco)

% The result should look like 
% 
% links =
% 
%   10×1 cell array
% 
%     'robot_base'
%     'jaco_1_shoulder_limb'
%     'jaco_2_upperarm_limb'
%     'jaco_3_forearm_limb'
%     'jaco_4_upperwrist_limb'
%     'jaco_5_lowerwrist_limb'
%     'jaco_6_hand_limb'
%     'jaco_8_finger_index'
%     'jaco_8_finger_thumb'
%     'jaco_8_finger_pinkie'
% 
% 
% joints =
% 
%   10×1 cell array
% 
%     'base_to_jaco_on_table'
%     'jaco_arm_0_joint'
%     'jaco_arm_1_joint'
%     'jaco_arm_2_joint'
%     'jaco_arm_3_joint'
%     'jaco_arm_4_joint'
%     'jaco_arm_5_joint'
%     'jaco_finger_joint_0'
%     'jaco_finger_joint_2'
%     'jaco_finger_joint_4'
%  
% So it stored these values in the arrays named links and joints
% Now we can apply force/torque to them. 
