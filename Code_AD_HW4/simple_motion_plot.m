function simple_motion_plot( Q , L)
end_effector=zeros(length(Q(:,1)),3);

for i=1:length(Q(:,1))
    q=Q(i,:);

    [graphx, graphy, graphz ]= plot_trajFK( q , L);
    end_effector(i,:)=[graphx(8),graphy(8),graphz(8)];
    pause(0.3)
    clf
    plot3(graphx, graphy, graphz, 'b', 'LineWidth',3)
    xlim([-1.5 1.5])
    ylim([-1.5 1.5])
    zlim([0 1.5])
    grid on
    hold on
    scatter3(graphx, graphy, graphz, 'r' , 'filled','LineWidth',1.2)
    hold on
    pause(0.3)
    plot3(end_effector(i,1),end_effector(i,2) , end_effector(i,3), 'o-', 'LineWidth',2 )
    hold on
  
end

for i=1:length(Q(:,1))
    plot3(end_effector(i,1),end_effector(i,2) , end_effector(i,3), 'x', 'LineWidth',2 )
    hold on
end

end