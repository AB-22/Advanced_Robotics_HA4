function [path_x , path_y ,path_z]=square_path(n_points)
traj_x= linspace(-0.3 , 0.3,n_points);
traj_x=[traj_x , 0.3*ones(1,n_points)];
traj_x=[traj_x , linspace(0.3 , -0.3,n_points)];
traj_x=[traj_x , -0.3*ones(1,n_points)];

traj_y=0.3*ones(1,n_points);
traj_y=[traj_y , linspace(0.3 , -0.3,n_points)];
traj_y=[traj_y , -0.3*ones(1,n_points)];
traj_y=[traj_y , linspace(-0.3 , 0.3,n_points)];

traj_z=[0.9*ones(1,n_points), 0.9*ones(1,n_points), 0.9*ones(1,n_points),0.9*ones(1,n_points)];

path_x=traj_x;
path_y=traj_y;
path_z=traj_z;

end