% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Diskretisierung

    % in-------------------------------------------------------------------
    
    global a                     % Domaingrenze links
    global b                     % Domaingrenze rechts
    global nx                    % Anzahl an Zellen

    % out------------------------------------------------------------------
    
    global l                     % Domainlaenge
    global dx                    % Zellbreite
    global x_Center              % Zellmitten
    global x_Edge                % Zellkanten
    global nx_ghost              % Anzahl an zellen mit Ghostzellen

    % inout----------------------------------------------------------------
    
    % Handle---------------------------------------------------------------

%--------------------------------------------------------------------------

l=b-a;
dx=l/nx;
nx_ghost=nx+2;
x_Center=linspace(a-dx/2,b+dx/2,nx_ghost);
x_Edge=linspace(a,b,nx_ghost-1);

end
