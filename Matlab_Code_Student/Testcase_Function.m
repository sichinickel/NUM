% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Testcase_Function

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global testcase_function     % Funktion für Anfangswertbedingung
    global x_Jump                % Lage der Unstetigkeit
    global w_states              % Primitive Statevektor
    global x_Center              % Zellmitten
    global nx_ghost              % Anzahl an zellen mit Ghostzellen
  
    % out------------------------------------------------------------------

    global u
    global w
    
    % inout----------------------------------------------------------------
    
    % Funktionshandle------------------------------------------------------
    
%--------------------------------------------------------------------------

% Constant
if testcase_function==1
    for i=1:nx_ghost
        w(i,1)=w_states(1,1);
        w(i,2)=w_states(1,2);
        w(i,3)=w_states(1,3);
    end
% Jump
elseif testcase_function==2
    for i=1:nx_ghost
        if x_Center(i)<=x_Jump
            w(i,1)=w_states(1,1);
            w(i,2)=w_states(1,2);
            w(i,3)=w_states(1,3);
        else
            w(i,1)=w_states(2,1);
            w(i,2)=w_states(2,2);
            w(i,3)=w_states(2,3);
        end
    end
end
 
[u]=Prims2Cons(w);
    
end
