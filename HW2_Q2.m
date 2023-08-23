% Code for HW_2 Q2

clear, close all, syms s Vo Rb Rc Ca Cd zeta C R 


% x={V1,V2,Ia,Ib,Ic,Id}  <-- unknown vector
A  =[ 1    0 1/s*Ca  0    0    0;    % V1 + Ia/sCa = Vo
      0    1    0   Rb    0    0;    % Ib*Rb + V2 = Vo
      1   -1    0    0   Rc    0;    % Ic*Rc + V1 - V2 = 0
      0  -Cd*s   0    0    0    1;   % Id -Cd*s*V2
      0    0    0   -1    1    1;    % -Ib + Ic + Id =0
      0    0    1    0    1    0];   % Ia + Ic = 0

b  =[ Vo; Vo; 0; 0; 0; 0];
x=A\b;
V1=simplify(x(1))
TransferFunc = V1/Vo


%Bode plot
% R = .3
% C = .3
F=RR_tf([.027 1.2 .3],[.027 1.254 .3]);
figure(4), RR_bode(F)