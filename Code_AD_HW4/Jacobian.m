function J = Jacobian(q,L,Tbase,Ttool)

H=FK(q,L,Tbase,Ttool);
R = H(1:3,1:3);

%1st column of Jacobian
J1p=Tbase*Tz(L(1))*Rzd(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
    Rz(q(5))*Tz(L(6))*Rx(q(6))*Tz(L(7))*Rz(q(7))*Ttool;

J1r=J1p*[R^-1 zeros(3,1);0 0 0 1];
J1=Jcol(J1r);


%2nd column of Jacobian
J2p=Tbase*Tz(L(1))*Rz(q(1))*Tz(L(2))*Rxd(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
    Rz(q(5))*Tz(L(6))*Rx(q(6))*Tz(L(7))*Rz(q(7))*Ttool;

J2r=J2p*[R^-1 zeros(3,1);0 0 0 1];
J2=Jcol(J2r);


%3rd column of Jacobian
J3p=Tbase*Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rzd(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
    Rz(q(5))*Tz(L(6))*Rx(q(6))*Tz(L(7))*Rz(q(7))*Ttool;

J3r=J3p*[R^-1 zeros(3,1);0 0 0 1];
J3=Jcol(J3r);


%4th column of Jacobian
J4p=Tbase*Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rxd(q(4))*Tz(L(5))*...
    Rz(q(5))*Tz(L(6))*Rx(q(6))*Tz(L(7))*Rz(q(7))*Ttool;

J4r=J4p*[R^-1 zeros(3,1);0 0 0 1];
J4=Jcol(J4r);


%5th column of Jacobian
J5p=Tbase*Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
    Rzd(q(5))*Tz(L(6))*Rx(q(6))*Tz(L(7))*Rz(q(7))*Ttool;

J5r=J5p*[R^-1 zeros(3,1);0 0 0 1];
J5=Jcol(J5r);


%6th column of Jacobian
J6p=Tbase*Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
    Rz(q(5))*Tz(L(6))*Rxd(q(6))*Tz(L(7))*Rz(q(7))*Ttool;

J6r=J6p*[R^-1 zeros(3,1);0 0 0 1];
J6=Jcol(J6r);


%7th column of Jacobian
J7p=Tbase*Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
    Rz(q(5))*Tz(L(6))*Rx(q(6))*Tz(L(7))*Rzd(q(7))*Ttool;

J7r=J7p*[R^-1 zeros(3,1);0 0 0 1];
J7=Jcol(J7r);

% Calculate the full Jacobian
J=[J1,J2,J3 ,J4,J5,J6,J7];
end


