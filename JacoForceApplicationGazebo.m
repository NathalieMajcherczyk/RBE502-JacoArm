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
rosshutdown
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

%% Apply a torque of 3 Newton-meter for 5 seconds on 'jaco_arm_1_joint'
% and observe it in Gazebo.. Enjoy!

stopTime = 40; % Seconds
effort = 5.0; % Newton-Meters
jointTorque(jaco, joints{2}, stopTime, effort);
jointTorque(jaco, joints{3}, stopTime, effort);
jointTorque(jaco, joints{4}, stopTime, effort);
jointTorque(jaco, joints{5}, stopTime, effort);
jointTorque(jaco, joints{6}, stopTime, effort);
jointTorque(jaco, joints{7}, stopTime, effort);


%% Capture 100 data points after sending the command
PosAndVel = rossubscriber('/gazebo/link_states')
for i = 1 : 100
    PosAndVelData(i) = receive(PosAndVel,10)   % The '10' is just for timeout
    joint_client = rossvcclient('/gazebo/get_joint_properties', 'Timeout', 10)
    joint_req = rosmessage(joint_client)
    joint_req.JointName = 'jaco_arm_0_joint';
    Angle_Positions0(i) = call(joint_client, joint_req, 'Timeout', 10)
    Angle_Position0_Data(i) = Angle_Positions0(i).Position;
    joint_req.JointName = 'jaco_arm_1_joint';
    Angle_Positions1(i) = call(joint_client, joint_req, 'Timeout', 10)
    Angle_Position1_Data(i) = Angle_Positions1(i).Position;
    joint_req.JointName = 'jaco_arm_2_joint';
    Angle_Positions2(i) = call(joint_client, joint_req, 'Timeout', 10)
    Angle_Position2_Data(i) = Angle_Positions2(i).Position;
    joint_req.JointName = 'jaco_arm_3_joint';
    Angle_Positions3(i) = call(joint_client, joint_req, 'Timeout', 10)
    Angle_Position3_Data(i) = Angle_Positions3(i).Position;
    joint_req.JointName = 'jaco_arm_4_joint';
    Angle_Positions4(i) = call(joint_client, joint_req, 'Timeout', 10)
    Angle_Position4_Data(i) = Angle_Positions4(i).Position;
    joint_req.JointName = 'jaco_arm_5_joint';
    Angle_Positions5(i) = call(joint_client, joint_req, 'Timeout', 10);
    Angle_Position5_Data(i) = Angle_Positions5(i).Position;

    %pause(0.1);
end

%% Plot the Data of all joints

figure
hold on
plot (Angle_Position0_Data, 'o')
plot (Angle_Position1_Data, '-')
plot (Angle_Position2_Data, '*')
plot (Angle_Position3_Data, '+')
plot (Angle_Position4_Data, '-*')
plot (Angle_Position5_Data, '-o')
title('Position Data for Applying Torgue of 5Nm on each joint')
legend ('jaco-arm-0-joint', 'jaco-arm-1-joint', 'jaco-arm-2-joint', ...
   'jaco-arm-3-joint' ,'jaco-arm-4-joint', 'jaco-arm-5-joint', ...
   'location', 'northwest'  )
ylabel('Encoder Counts')
xlabel('Simulation Time')
% %% Extract data for position of jaco_2_upperarm_limb
% for i = 1: 100
%     jaco_2_upperarm_limb_position(i) = PosAndVelData(i).Pose(5).Position.X;
%     jaco_2_upperarm_limb_position(i) = PosAndVelData(i).Pose(5).Position.Y;
%     jaco_2_upperarm_limb_position(i) = PosAndVelData(i).Pose(5).Position.X;
% end
% 
% %% Extract data for position of jaco_2_upperarm_limb
% for i = 1: 100
%     jaco_2_upperarm_limb_velocity(i) = PosAndVelData(i).Twist(4).Linear.X;
% end
% 
