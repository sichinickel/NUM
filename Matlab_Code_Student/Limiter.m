% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [slope]=Limiter(a,b)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    global limiter % limiter type
    global beta    % parameter
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

% Limitierung
if limiter==1       %MINMOD
%%%START_STUDENT
%%%END_STUDENT
elseif limiter==2   %SWEBY
%%%START_STUDENT
%%%END_STUDENT
elseif limiter==3   %generalized MINMOD
%%%START_STUDENT
%%%END_STUDENT
end

end

