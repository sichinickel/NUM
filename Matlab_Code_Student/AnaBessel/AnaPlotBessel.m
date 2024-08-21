clc 
clear global

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
global n_array          %Anzahl der Matrizeneinträge für Besselfunktion
global m_sum;

%Symbolic Variables
syms theta r tau

%Values of Global Variables
n_sum=5;
m_sum=5;
n_array=100;

%Bestimmung der Koeffizienten
k=zeros(n_sum, m_sum);
A=zeros(n_sum, m_sum);
for i=1:n_sum
    k(i,:)=besselzero(i, m_sum, 1);
    for kk=1:m_sum
        A(i,kk)= A_int1(i) + A_int2(i, k(i,kk)); 
    end     
end

syms T(tau, r, theta)
T=0;
for n=1:n_sum
    for m=1:m_sum
        T=T+T_funk(n, m, k(n,m), A(n,M));
end