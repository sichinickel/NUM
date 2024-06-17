% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [source]=Source(u,w)
 
% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global n_var                 % Anzahl an Variablen im System
    global nx_ghost              % Anzahl an zellen mit Ghostzellen
    
    % out------------------------------------------------------------------
 
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

% Allocation 
source=zeros(nx_ghost,n_var);

% Quellterme sollen hier vernachlässigt werden S(U)=0 :
source(:,1)=0;
source(:,2)=0;
source(:,3)=0;

end
