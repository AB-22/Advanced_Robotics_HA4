function q_updated = Null_Space (q,L, weights,p_goal,k)
q_updated=q;
p_curr= FK(q_updated,L, eye(4),eye(4));
p_curr= [p_curr(1:3,4); [0,0,0]'];
err=p_goal-p_curr;
I_m=ones(7,7);

while (abs(sqrt(sum(err(1:3).^2)))>0.01)
    jacob=Jacobian(q_updated,L, eye(4),eye(4));
    del_err= err/k; %k is a coeffecient that reduces amplitude for small values
    H0=sqrt(det(jacob*jacob'));
    delta_q=0.001;
    dq0_now=zeros(7,1);
    for i=1:length(jacob)
        qq_now=q_updated;
        qq_now(3)=qq_now(3)+delta_q;
        
        jac_now=Jacobian(qq_now,L, eye(4),eye(4));
        H_now=sqrt(det(jac_now*jac_now'));
        dq0_now(i)=(H_now-H0)/delta_q;
    end
    
    J_WPI=(pinv(weights)*jacob')*pinv(jacob*pinv(weights)*jacob');% 7x6

    del_q=J_WPI*del_err + (I_m-J_WPI*jacob)*dq0_now;
    
    q_updated=q_updated+del_q;
    
    p_curr=FK(q_updated,L, eye(4),eye(4));
    p_curr= [p_curr(1:3,4); [0,0,0]'];
    err=p_goal-p_curr;
    
end    
        
end