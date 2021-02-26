function [graphx, graphy, graphz]= plot_trajFK( q , L)
 pos0=[0 , 0, 0]';
 T=Tz(L(1));
 pos1=T(1:3,4);
 
 T=Tz(L(1))*Rz(q(1))*Tz(L(2));
 pos2=T(1:3,4);
 
 T=Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3));
 pos3=T(1:3,4);
 
 T=Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4));
 pos4=T(1:3,4);
 
 T=Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5));
 pos5=T(1:3,4);
 
 T=Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
    Rz(q(5))*Tz(L(6));
 pos6=T(1:3,4);
 
 T=Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
    Rz(q(5))*Tz(L(6))*Rx(q(6))*Tz(L(7))*Rz(q(7));
 pos7=T(1:3,4);
 
 graphx=[pos0(1),pos1(1),pos2(1),pos3(1),pos4(1),pos5(1),pos6(1),pos7(1)];
 graphy=[pos0(2),pos1(2),pos2(2),pos3(2),pos4(2),pos5(2),pos6(2),pos7(2)];
 graphz=[pos0(3),pos1(3),pos2(3),pos3(3),pos4(3),pos5(3),pos6(3),pos7(3)];
end