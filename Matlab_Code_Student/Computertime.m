% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Computertime(t,i)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global measuretime           % Computation Time
    global simtime               % Simulation Time
    global nx                    % Anzahl Freiheitsgrade

    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% Algorithmus

simtime=simtime+measuretime;

fprintf('-------------------------------------------- \n');
fprintf('Iteration        = %i\n',i);
fprintf('Simulation Time  = %1.6f \n',t);
fprintf('Computation Time = %6.3f\n',simtime);
fprintf('PID              = %1.6e\n',simtime/(i*nx));
fprintf('Last Measurement = %6.3f\n',measuretime);

end

