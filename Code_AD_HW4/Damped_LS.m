function q_updated= Damped_LS (q,L,p_goal,k)

q_updated=q;
p_curr= FK(q_updated,L, eye(4),eye(4));
p_curr= [p_curr(1:3,4); [0,0,0]'];
err=p_goal-p_curr;
u=0.2;
I_m=ones(6);

while (abs(sqrt(sum(err(1:3).^2)))>0.01  )
    jacob=Jacobian(q_updated,L, eye(4),eye(4));
    del_err= err/k; %k is a coeffecient that reduces amplitude for small values
    J_DLS=(jacob'*pinv(jacob*jacob'+(u^2)*I_m));
    
    del_q=J_DLS*del_err;
    q_updated=q_updated + del_q;
    
    p_curr=FK(q_updated,L, eye(4),eye(4));
    p_curr= [p_curr(1:3,4); [0,0,0]'];
    err=p_goal-p_curr;
    
end
    
end