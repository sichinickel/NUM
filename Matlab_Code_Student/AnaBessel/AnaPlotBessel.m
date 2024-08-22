clc 
clear
close all
% Schritte zum lösen:
%     1. Variablen initialisieren
%             Syms:   theta
%                     r
%     2. Besselfunktion 
%     3. Besselfunktion sphärisch
%     4. Ks bestimmen
%     5. Matrix befüllen mit 2. und 3. 
%     6. Allgemein Lösung
%     7. Plotten 


%Global Variables
global n_sum            %Anzahl Summenglieder
global m_sum            %Auch Anzahl der Summenglieder, aber dieses mal andersrum

%Symbolic Variables
syms theta r tau

%Values of Global Variables
n_sum=10;
m_sum=10;
tau0=0;
r0=0.5;
theta0=pi;
   
%Bestimmung der Koeffizienten
k=zeros(n_sum, m_sum);
A=zeros(n_sum, m_sum);
for i=1:n_sum
    k(i,:)=besselzero(i-0.5, m_sum, 1);
    for kk=1:m_sum
        A(i,kk)= A_int1(i-1) * A_int2(i-1, k(i,kk));
    end
end

syms T(tau, r, theta)
T=0;
for n=1:n_sum
    for m=1:m_sum
        T=T+T_funk(n-1, m, k(n,m), A(n,m), theta, r, tau);
    end
end

%Potten der Ergebnisse
T0=subs(T,tau,tau0);
T1=subs(T0,r,r0);
T2=subs(T0,theta,theta0);
T3=subs(T1,theta,theta+pi);
fplot(T1,[0 2*pi])
%fplot(T3,[0 2*pi])