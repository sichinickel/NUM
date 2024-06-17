% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Datenausgabe(u,w,i,t)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global Vars_Inifile          % save the Ini_Variables
    
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

cd Daten

% Daten speichern
save(['Daten_t=' num2str(i) '.mat'],'u','w','t','i','Vars_Inifile');

cd ..
 
end

