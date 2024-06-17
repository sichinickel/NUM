% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [var_gradient]=Gradient(var)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global dx                    % Zellbreite
    global nx_ghost              % Anzahl an zellen mit Ghostzellen

    % out------------------------------------------------------------------

    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

var_gradient=(var(3:nx_ghost)-var(1:nx_ghost-2))/(2*dx);

end

