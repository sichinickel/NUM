% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Handle

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
   
    global riemann               % Verschiedene Riemannloeser
    global eos                   % Zustandsgleichung
    global system                % Equation System Flag
    
    % out------------------------------------------------------------------
    
    global Handle_Wavespeed      % Funktionshandle für Schallgeschwindigkeit     
    global Handle_Riemann        % Funktionshandle für Riemannloeser     
    global Handle_EOS            % Funktionshandle für EOS 
    global String_System         % Name des Systems   
    global String_Riemann        % Name des Riemannlöser    
    global String_EOS            % Name des System     

    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% Schallgeschwindigkeit
Handle_Wavespeed=@(isen,dichte,druck) sqrt(isen*druck./dichte);

% Riemannlöser
switch riemann
    case{1}
        Handle_Riemann=@Flux_Lax_Friedrich;
        String_Riemann='Lax-Friedrich';
    case{2}
        Handle_Riemann=@Flux_HLL;
        String_Riemann='HLL';
end

% EOS
switch eos
    case{1}
        Handle_EOS=@EOS_Ideal;
        String_EOS='Ideal-Gas-Equation';
end

% System
switch system
case{1}
    String_System='Cartesian Euler Equations';
case{2}
    String_System='Cartesian Navier-Stokes Equations';
end

end

