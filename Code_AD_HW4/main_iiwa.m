% By Amer Al Badr, Suliman Badour , Mohamad Al Mdfaa

% Redundant Robot KUKA iiwa LBR14 R820
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc

% Define link lengths for KUKA iiwa LBR14 R820

link_lengths = [0.160, 0.200, 0.210, 0.210, 0.200, 0.200, 0.126];

%% Testing Weighted Pseudo Inverse IK function
p_des=[0.2 , 0.2 ,1 , 0 ,0 ,0]';
q_start=[0,0,0,0,0,0,0]';
weights=diag([10 80 50 30 30 12 1]);
q1=Weighted_PseudoInverse(q_start,link_lengths,weights,p_des,100);
pp1=FK(q1,link_lengths,eye(4),eye(4));
pp1=pp1(1:3,4);
e1=abs(pp1-p_des(1:3))
%% Testing Damped Least Square IK function
p_des=[0.2 , 0.2 , 0.7, 0 ,0 ,0]';
q_start=[0,0,0,0,0,0,0]';
q2=Damped_LS(q_start,link_lengths,p_des,100);
pp2=FK(q2,link_lengths,eye(4),eye(4));
pp2=pp2(1:3,4);
e2=abs(pp2-p_des(1:3))
%% Testing Weighted Null Space IK function
p_des=[0.2 , 0.2 ,0.5 , 0 ,0 ,0]';
q_start=[0,0,0,0,0,0,0]';
weights=diag([10 80 50 30 30 12 1]);
q3=Null_Space(q_start,link_lengths,weights,p_des,100);
pp3=FK(q3,link_lengths,eye(4),eye(4));
pp3=pp3(1:3,4);
e3=abs(pp3-p_des(1:3))
%% Testing Task Priority IK function
p_des=[0.2 , 0.2 ,0.5 , 0 ,0 ,0]';
q_start=[0,0,0,0,0,0,0]';
weights=diag([10 80 50 30 30 12 1]);
q4=Task_Priority(q_start ,weights, p_des , link_lengths, 100);
pp4=FK(q4,link_lengths,eye(4),eye(4));
pp4=pp4(1:3,4);
e4=abs(pp4-p_des(1:3))

%% Simple Motion Plotting
Q=[q1';q2';q3'; q3'];
figure('Name',' Simple Motion Plotting')

simple_motion_plot( Q , link_lengths)
xlabel('x')
ylabel('y')
zlabel('z') 
title('FK Trajectory Motion')
%% Plot Motion of Robot along a square path with task priority
num_of_points=10;
link_lengths = [0.160, 0.200, 0.210, 0.210, 0.200, 0.200, 0.126];
q_start=[0,0,0,0,0,0,0]';
weights=diag([10 80 50 30 30 12 1]);
[square_x ,square_y , square_z]=square_path(num_of_points);
Q=zeros(num_of_points,7);

for i=1:length(square_z)
    p_goal=[square_x(i) , square_y(i) ,square_z(i) , 0 , 0 , 0]';
    q_square_path=Task_Priority(q_start ,weights, p_goal , link_lengths, 100);
    Q(i,:)=q_square_path';
        
end

% Plotting Part
figure ('Name','Motion of Robot along a square path with task priority')

simple_motion_plot( Q , link_lengths)
xlabel('x')
ylabel('y')
zlabel('z') 
title('Motion on a Square')
