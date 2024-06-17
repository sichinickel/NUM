% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Legende(t,i)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global plotvar               % Flag für u oder w Visualisierung

    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

if plotvar==1
    subplot(2,2,1);
    title('Mass Density');
    subplot(2,2,2);
    title('Impuls Density');    
    subplot(2,2,3);
    title('Energy Density');    
    subplot(2,2,4);
    title('Temperatur');
elseif plotvar==2
    subplot(2,2,1);
    title('Mass Density');
    subplot(2,2,2);
    title('Velocity');    
    subplot(2,2,3);
    title('Pressure');    
    subplot(2,2,4);
    title('Temperatur Gradient');
end

end

