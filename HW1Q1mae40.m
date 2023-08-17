% Modification of code to solve HW1 Q1 and Q2
% Solves the equations of a simple passive filter

clear, close all, syms s Vi C L RL zeta


% Second-order low-pass LC filter: Solve for Vo as a function of Vi
% x={I_L,Ic,I_R,Vo}  <-- unknown vector
A  =[ 1   -1   -1    0;    % I_L - Ic - I_R= 0
      0   -1    0  C*s;    % C*s*Vo - Ic = 0
      0    0    RL  -1;    % I_R*RL - Vo = 0
      L*s  0    0    1];   % L*s*I_L + Vo = Vi
b  =[ 0; 0; 0; Vi];
x=A\b
Vo_LPF2_undamped=simplify(x(4));
TrasnferFunc=Vo_LPF2_undamped/Vi

%Bode plot with different zeta values:
omega4=10; zeta=.1; F_LPF2_undamped=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(3), RR_bode(F_LPF2_undamped)

omega4=10; zeta=.7; F_LPF2_undamped=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(4), RR_bode(F_LPF2_undamped)

omega4=10; zeta=1; F_LPF2_undamped=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(5), RR_bode(F_LPF2_undamped)