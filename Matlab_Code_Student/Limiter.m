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

if abs(a) < abs(b) & a*b > 0
    slope = a;
elseif abs(a) >= abs(b) & a*b > 0
    slope = b;
else
    slope = 0;
end

%%%END_STUDENT
elseif limiter==2   %SWEBY
%%%START_STUDENT

if abs(a) < abs(beta*b) & a*beta*b > 0
        minmod_a_betab = a;
    elseif abs(a) >= abs(beta*b) & a*beta*b > 0
        minmod_a_betab = beta*b;
    else
        minmod_a_betab = 0;
end
minmod_a_betab_abs = abs(minmod_a_betab);

if abs(beta*a) < abs(b) & beta*a*b > 0
        minmod_betaa_b = beta*a;
    elseif abs(beta*a) >= abs(b) & beta*a*b > 0
        minmod_betaa_b = b;
    else
        minmod_betaa_b = 0;
end
minmod_betaa_b_abs = abs(minmod_betaa_b);

minmod_abs_max = max(minmod_a_betab_abs, minmod_betaa_b_abs);
slope = sign(a)*minmod_abs_max;

%%%END_STUDENT
elseif limiter==3   %generalized MINMOD
%%%START_STUDENT

sa = sign(a);
sb = sign(b);

betaasa_bsa_min = min(beta*(a.*sa), b.*sa);
betaasa_bsa_min_max = max(0, betaasa_bsa_min);
betabsa_asb_min = min(beta*(b.*sa), a.*sb);
betabsa_asb_min_max = max(0, betabsa_asb_min);

slope = 0.5*(sa.*betaasa_bsa_min_max + sb.*betabsa_asb_min_max);

%%%END_STUDENT
end

end

