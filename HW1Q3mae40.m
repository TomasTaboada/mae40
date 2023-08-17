% Modification of code to solve HW1 Q3
% Solves the equations of a simple passive filter

clear, close all, syms s Vi C Cd L Rd zeta 


% Second-order low-pass LC filter: Solve for Vo as a function of Vi
% x={I_L,Ic,I_Rd,I_Cd,Vm,Vo}  <-- unknown vector
A  =[ 1   -1   -1    0    0    0;    % I_L - Ic - I_Rd = 0
      0    0    1   -1    0    0;    % I_Rd - I_Cd = 0
      0   -1    0    0    0   C*s;   % Vo*C*s - Ic = 0
      L*s  0    0    0    0    1;    % I_L*L*s + Vo = Vi
      0    0   -Rd   0    -1   1;    % Vo - Vm - I_Rd*Rd = 0
      0    0    0    -1  Cd*s   0];   % Vm*C*s - I_Cd = 0

b  =[ 0; 0; 0; Vi; 0; 0];
x=A\b; Vo_LPF2_undamped=simplify(x(6))
TransferFunc = Vo_LPF2_undamped/Vi