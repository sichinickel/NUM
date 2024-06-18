% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [g_flux_diffusiv]=Flux_Diffusiv(u,w)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global nx                    % Anzahl an Zellen
    global dx                    % Zellbreite
    global nx_ghost              % Anzahl an zellen mit Ghostzellen
    global mu                    % kinematische Viskosiitaet
    global lambda                % Wärmeleitungskoeffizient
    global system                % Equation System Flag
    global Handle_EOS            % Funktionshandle für EOS 
    
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

% Gradienten, Jumps und und Averages
[temperatur(:,1)]=Handle_EOS(u,w,[],[],2);
[temperatur_jump]=Jump(temperatur(1:nx_ghost-1,1),temperatur(2:nx_ghost,1));
[velocity_average]=Average(w(1:nx_ghost-1,2),w(2:nx_ghost,2));
[velocity_jump]=Jump(w(1:nx_ghost-1,2),w(2:nx_ghost,2));
velocity_grad=velocity_jump/dx;
temperatur_grad=temperatur_jump/dx;


% Diffusiver Fluss
if system==1                   % Euler-Equation
%%%START_STUDENT
    g_flux_diffusiv=zeros(nx+1,3);
%%%END_STUDENT
elseif system==2               % Navier-Stokes-Equation
%%%START_STUDENT
%%%END_STUDENT
else
    error('No such system implemented')
end
    
end
