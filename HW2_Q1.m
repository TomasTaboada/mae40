% Code for HW_2 Q1

clear, close all, syms s Vo Ra Rd Cb Cc zeta 


% x={V1,V2,Ia,Ib,Ic,Id}  <-- unknown vector
A  =[ 1    0   Ra    0    0    0;    % V1 + Raa = Vo
      0    1    0 1/s*Cb  0    0;    % V2 + Ib/(s*Cb) = Vo
      1   -1    0    0 1/s*Cc  0;    % V1 - V2 + Ic/(s*Cc) = 0
      0   -1    0    0    0   Rd;    % -V2 + Id*Rd = 0
      0    0    0   -1    1    1;    % -Ib + Ic + Id =0
      0    0    1    0    1    0];   % Ia + Ic = 0

b  =[ Vo; Vo; 0; 0; 0; 0];
x=A\b;
V1=simplify(x(1))
TransferFunc = V1/Vo


%Bode plot
omega=10; F=RR_tf([1 omega omega^2],[1 3*omega omega^2]);
figure(3), RR_bode(F)