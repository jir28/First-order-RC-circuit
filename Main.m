%First-order RC circuit capacitor voltage modeling program
close all; clear; clc;

%initial condition simulink
y0 = 2;

%Circuit Values
R = 47e3;
C = 10e-6;
tau = R*C;
alpha = (-1)/tau;
beta = 1/tau;

tfinal = 5*tau;
Ts = tau/10;
t = (0:Ts:tfinal)';

%Case a)     u(t) = 5v; y0 = 0v
yta = 5*exp(alpha*t).*(exp(-alpha*t)-1);

%Case b)     u(t) = 0v; y0 = 5v
ytb = 2*exp(alpha*t);

%Case c)     u(t) = 1v; y0 = 2v
ytc = 2*exp(alpha*t)+exp(alpha*t).*(exp(-alpha*t)-1);

yt_max = max(yta);

%% 


figure(1)
plot(t,yta,'b','LineWidth',1,'DisplayName','u(t) = 5V, y0 = 0V')
grid on;
title('Voltaje de un capacitor en un circuito RC de primer orden')
xlabel('Tiempo[s]')
ylabel('Voltaje Capacitor [V]')
axis ([0,tfinal,0,1.1*yt_max])
hold on

plot(t,ytb,'r','LineWidth',1,'DisplayName','u(t) = 0V, y0 = 5V')
plot(t,ytc,'k','LineWidth',1,'DisplayName','u(t) = 1V, y0 = 2V')
legend
%% Comparison of Simulink graphs vs Analytical Solution

tsim = out.uy.Time;
yt_a = out.uy.Data(:,1);
figure(2)
plot(tsim,yt_a,'*','LineWidth',2,'DisplayName','Simulink')
grid on;
xlabel('Tiempo[s]')
ylabel('Voltaje Capacitor [V]')
title('Voltaje de un capacitor en un circuito RC (Sol. analiticia vs Simulink)')
hold on
plot(t,ytc,'r','LineWidth',1,'DisplayName','Sol. analitica')
axis ([0,tfinal,0,1.1*yt_max])
legend

