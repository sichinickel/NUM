% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [u,w]=Operator_Zeit(u,w,t,dt)

 % Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global order_time            % Zeitliche Ordnung

    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
 
    global residuum              % Ergebnis des Raumoperators           
    global transport             % Fluss faktorisiert mit Laenge und Flaeche
    global source                % Quelle
    
%--------------------------------------------------------------------------
 
 if order_time==1
    
    % Euler Cauchy Verfahren
    
    tstage=t;
    stage=1;
    [transport,source]=Operator_Raum(u,w,tstage,stage);
    k1=transport-source;
    residuum=dt*k1;
    
 elseif order_time==2
    
    % verbesserte Euler Cauchy Verfahren 
    
    %%%START_STUDENT
    tstage=t;
    stage=1;
    [transport_p, source_p] = Operator_Raum(u, w, tstage, stage);
    u_prae=u-0.5*dt*(transport_p - source_p);
    [u_prae, w_prae] = Update(u_prae);
    [transport, source] = Operator_Raum(u_prae, w_prae, tstage + 0.5*dt, stage);
    k1 = transport-source;
    residuum=dt*k1;
    %%%END_STUDENT
    
 else
    error('No such temporal order implemented')
 end
 
 u=u-residuum;
 
[u,w]=Update(u);
 
end
