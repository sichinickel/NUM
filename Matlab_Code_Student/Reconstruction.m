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
s_left= u(2:nx_ghost-1,:)-u(1:nx_ghost-2,:);
s_right = u(3:nx_ghost,:)-u(2:nx_ghost-1,:);
%%%END_STUDENT

% Limitierung MINMOD

%%%START_STUDENT
slope = Limiter(s_left,s_right);
slope = (1/dx) * slope;
%%%END_STUDENT
                             
% Reconstruction to the right ---> u+

%%%START_STUDENT
u_right(2:nx_ghost-1,:)= u(2:nx_ghost-1,:) + 0.5 * dx * slope;    
%%%END_STUDENT

% Reconstruction to the left  ---> u-

%%%START_STUDENT
u_left(2:nx_ghost-1,:)= u(2:nx_ghost-1,:) - 0.5 * dx * slope;
%%%END_STUDENT

end

