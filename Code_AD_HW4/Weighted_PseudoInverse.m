function q_updated=Weighted_PseudoInverse(q,L, weights,p_goal,k)
q_updated=q;
p_curr= FK(q_updated,L, eye(4),eye(4));
p_curr= [p_curr(1:3,4); [0,0,0]'];
err=p_goal-p_curr;

while (abs(sqrt(sum(err(1:3).^2)))>0.01)
    jacob=Jacobian(q_updated,L, eye(4),eye(4));
    
    del_err= err/k; %k is a coeffecient that reduces amplitude for small values
    
    J_WPI=(pinv(weights)*jacob')*pinv(jacob*pinv(weights)*jacob');
    
    del_q=J_WPI*del_err;
    
    q_updated=q_updated+del_q;
    
    
    p_curr=FK(q_updated,L, eye(4),eye(4));
    p_curr= [p_curr(1:3,4); [0,0,0]'];
    err=p_goal-p_curr;
    
end
       
end