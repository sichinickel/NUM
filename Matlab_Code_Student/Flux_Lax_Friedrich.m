% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [flux] = Flux_Lax_Friedrich(rho_l,rho_r,v_l,v_r,p_l,p_r)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global kappa                 % Isentropenkoeffizient
    global dx                    % Zellbreite
    global dt                    % Zeitschritt
    global cfl                   % CFl-Zahl
    
    %   rho,v,p = Dichte, Geschwindigkeit, Druck
    %   *_r = rechte Werte
    %   *_l = linke Werte
    
    % out------------------------------------------------------------------
    
    %   flux = numerischer Fluss
    
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% Fluss-Lax-Friedrich
a = cfl*dx/dt;
%%%START_STUDENT
u_l =  [rho_l...,
        rho_l.*v_l...,
        (p_l/(kappa-1))+0.5*rho_l.*v_l.^2];
u_r=   [rho_r...,
        rho_r.*v_r...,
        (p_r/(kappa-1))+0.5*rho_r.*v_r.^2];
f_l=   [rho_l.*v_l...,
        rho_l.*v_l.^2+p_l...,
        0.5.*rho_l.*v_l.^3+(kappa/(kappa-1)).*v_l.*p_l];
f_r=   [u_r(:,2)...,
        rho_r.*v_r.^2+p_r...,
        0.5*rho_r.*v_r.^3+(kappa/(kappa-1)).*v_r.*p_r];
        
flux= 0.5*(f_l+f_r)- 0.5*a*(u_r-u_l);
%%%END_STUDENT

end

