% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [u_left,u_right]=Reconstruction(u,grad)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global dx                    % Zellbreite
    global nx_ghost              % Anzahl an zellen mit Ghostzellen
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

% Allocation
u_left=u;
u_right=u;

% Gradient links und rechts

%%%START_STUDENT
%%%END_STUDENT

% Limitierung MINMOD

%%%START_STUDENT
%%%END_STUDENT
                             
% Reconstruction to the right ---> u+

%%%START_STUDENT
u_right(2:nx_ghost-1,:)=     
%%%END_STUDENT

% Reconstruction to the left  ---> u-

%%%START_STUDENT
u_left(2:nx_ghost-1,:)=
%%%END_STUDENT

end

