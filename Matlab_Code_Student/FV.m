% Finite-Volumen-Verfahren 1D-Navier-Stokes-Gleichungen
% 
% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

clc
clear global

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Globale Variablen

global order_time            % zeitliche Konvergenzorndung
global order_space           % raeumliche Konvergenzorndung
global cfl                   % CFl-Zahl
global riemann               % Verschiedene Riemannloeser
global eos                   % Zustandsgleichung
global t_end                 % Simulationende
global testcase              % Testcase (Anfangswertproblem)
global system                % Equation System Flag
global nx                    % Anzahl an Zellen
global a                     % Domaingrenze links
global b                     % Domaingrenze rechts
global datenausgabe          % Datenausgabe Flag
global animation             % Animation Flag
global iter_animation        % Iterationsintervall Animation
global iter_datenausgabe     % Iterationsintervall Datenausgabe
global dt_animation          % Zeitschrittintervall Animation
global dt_datenausgabe       % Zeitschrittintervall Datenausgabe
global x_Jump                % Lage der Unstetigkeit
global plotvar               % Flag für u oder w Visualisierung
global Vars_Inifile          % save the Ini_Variables
global limiter               % Limiter Typ
global beta                  % Parameter für Limiter

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
  
%  Equation System:--------------------------------------------------------
system=1;                                                                     

% Cartesian Euler system       = 1
% Cartesian Navier system      = 2

% Zeitliche Ordnung:-------------------------------------------------------
order_time=1;
order_space=1;

limiter=3; % minmod = 1, sweby = 2, G-minmod = 3
beta = 1.4; % Parameter für Sweby und G-minmod Limiter
% Flag Datenausgabe:-------------------------------------------------------
datenausgabe         = 0;
iter_datenausgabe    = 1000; 
dt_datenausgabe      = 1;

% Flag Animation:----------------------------------------------------------
animation            = 1;
iter_animation       = 100; 
dt_animation         = 1;

% CFL-Bedingung:-----------------------------------------------------------
cfl=0.7;

% Ende der Simulation:-----------------------------------------------------
t_end=0.125;

% Hinweis: Startzeit t=0
   
% Simulationsgebiet:-------------------------------------------------------
nx=100;
a=0;
b=1;
x_Jump=0.5;
    
% Anfangswertproblem:------------------------------------------------------
testcase=1;

% Lax Shock Tube = 1

% Fluss:-------------------------------------------------------------------
riemann=1;

% Lax-Friedrichs (global)  = 1
% HLL                      = 2  

% Zustandsgleichung:-------------------------------------------------------                                                       
eos=1;

% ideale EOS = 1
    
% Welche Variablen sollen geplottet werden?:-------------------------------                                                   
plotvar=2;

% Konservative=1
% Primitive=2

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

Vars_Inifile=whos;

% Aufruf des Strömungslösers
Main;

clear;
