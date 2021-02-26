function q_updated=Task_Priority(q ,weights, p_goal , L, k)

q_updated=q;
p_oriented_vertical=[p_goal(1) ; p_goal(2) ; p_goal(3) ; pi/2 ; 0 ; 0];
p_goal_vertical=[p_goal ; p_oriented_vertical];
p_curr= FK(q_updated,L, eye(4),eye(4));
p_curr= [p_curr(1:3,4); [0,0,0]' ; p_curr(1:3,4) ; [pi/2,0,0]' ];

err=p_goal_vertical-p_curr;

while (abs(sqrt(sum(err(1:3).^2)))>0.01)
    jacob=Jacobian(q_updated,L, eye(4),eye(4));
    jacob_full=[jacob ; jacob];
    del_err= err/k; %k is a coeffecient that reduces amplitude for small values
    
    J_WPI=(pinv(weights)*jacob_full')*pinv(jacob_full*pinv(weights)*jacob_full'); % 7x12
    
    del_q=J_WPI*del_err;
    
    q_updated=q_updated+del_q;
    
    
    p_curr=FK(q_updated,L, eye(4),eye(4));
    p_curr= [p_curr(1:3,4); [0,0,0]' ; p_curr(1:3,4) ; [pi/2,0,0]' ];
    err=p_goal_vertical-p_curr;
    
end


end