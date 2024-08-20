% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [dt]=CFL(w)

    % in-------------------------------------------------------------------

    global Handle_Wavespeed      % Funktionshandle für Schallgeschwindigkeit     
    global cfl                   % CFl-Zahl
    global system                % Equation System Flag
    global dx                    % Zellbreite
    global kappa                 % Isentropenkoeffizient
    global mu                    % kinematische Viskosiitaet
    global lambda                % Wärmeleitungskoeffizient

    % out------------------------------------------------------------------
 
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

% Zeitschrittberechnung
soundspeed=Handle_Wavespeed(kappa,w(:,1),w(:,3));
%%%START_STUDENT
v_max = max(abs(w(:,2))+abs(soundspeed));
dtc=cfl*(dx/v_max);
%%%END_STUDENT
if system==1       % Euler
%%%START_STUDENT
dtd=cfl*(0.5*dx^2)/lambda;
%%%END_STUDENT
elseif system == 2 % Navier
%%%START_STUDENT
dtd =  0.5*dx^2/(lambda + (4/3)*v_max*mu);
%%%END_STUDENT
else 
   error('No such system implemented')
end
dt=min(dtc,dtd);

end

