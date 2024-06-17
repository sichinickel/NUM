% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [flux_convectiv] = Flux_Convectiv(w_left,w_right)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
       
    global Handle_Riemann        % Funktionshandle für Riemannloeser  
    global nx                    % Anzahl an Zellen
    global nx_ghost              % Anzahl an zellen mit Ghostzellen
    
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

% Riemann Solver (Konvektiver Fluss)

[flux_convectiv(1:nx+1,:)]=Handle_Riemann(w_right(1:nx_ghost-1,1),w_left(2:nx_ghost,1),...
                                          w_right(1:nx_ghost-1,2),w_left(2:nx_ghost,2),...
                                          w_right(1:nx_ghost-1,3),w_left(2:nx_ghost,3)); 

% Bedeutung "links" und "rechts"------------------------------------------

% hier:              bzgl. Zelle
% im Riemannlöser:   bzgl. Seite

% -> left wird zu right
% -> right wird zu left

% -------------------------------------------------------------------------

end

