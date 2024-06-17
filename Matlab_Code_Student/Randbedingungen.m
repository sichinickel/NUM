% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [w]=Randbedingungen(w,tstage)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global boundary_condition    % Randbedingung
    global nx_ghost              % Anzahl an zellen mit Ghostzellen
    global w_states
    
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% Left
if boundary_condition(1)==1  % Exact
    w(1,1)=w_states(1,1);
    w(1,2)=w_states(1,2);
    w(1,3)=w_states(1,3);
else
    error('No such Boundary implemented');
end

% Right
if boundary_condition(2)==1  % Exact
    w(nx_ghost,1)=w_states(2,1);
    w(nx_ghost,2)=w_states(2,2);
    w(nx_ghost,3)=w_states(2,3);
else
    error('No such Boundary implemented');
end

end
