% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function EOS_Data

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global eos                   % Zustandsgleichung
    
    % out------------------------------------------------------------------
    
    global kappa                 % Isentropenkoeffizient
    global R                     % ideale spezifische Gaskonstante
    global cv                    % Waermekapazität bei konstanten Volumen
    global cp                    % Waermekapazität bei konstanten Druck
    global mu                    % kinematische Viskosiitaet
    global lambda                % Wärmeleitungskoeffizient
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

if eos==1           % ideales Gas
    cp=1005;
    cv=718;
    R=cp-cv;
    kappa=cp./cv;
    mu=0.00171;
    lambda=0.0262;    
else
    error('No such EOS implemented');
end   

end
