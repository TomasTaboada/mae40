% Code for HW_3
% Q1
clear, close all, syms s Vi R C c1 L 


% x={Vo,Vm,Il,Ic,Ir,Irl}  <-- unknown vector
A  =[ 0    1   s*L    0    0    0;    % s*L*Il = Vi
      1   -1    0 1/(s*C)  0    0;    % Ic/s*C + Vo - Vm = 0
    -1     0    0    0    R     0;    % Ir*R - Vo = 0
    -c1    0    0    0    0     R;    % Irl*(R) - Vo*c1 = 0
      0    0    1   -1    0     0;    % Il - Ic = 0
      0    0   -1    0    1     1];   % Ir + Irl - Il = 0

b  =[ Vi; 0; 0; 0; 0; 0];
x=A\b;
Vo=simplify(x(1))
TransferFunc = Vo/Vi


%Bode plot
omega=10;
Q=5; 
F=RR_tf([1 omega/Q],[1 omega/Q omega^2]);
figure(1), RR_bode(F)
