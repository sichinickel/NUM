% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [flux] = Flux_HLL(rho_l,rho_r,v_l,v_r,p_l,p_r)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    global kappa                 % Isentropenkoeffizient
    global nx                    % Anzahl an Zellen

    %   rho,v,p = Dichte, Geschwindigkeit, Druck
    %   *_r = rechte Werte
    %   *_l = linke Werte
    % out------------------------------------------------------------------

    %   flux = numerischer Fluss

    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% Fluss-HLL

%%%START_STUDENT
flux = zeros(nx+1,3);
c_l=sqrt(kappa*p_l./rho_l);
c_r=sqrt(kappa*p_r./rho_r);
a_l(:)=min(v_l(:)-c_l(:),0);
a_r(:)=max(v_r(:)+c_r(:),0);
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
    
    
    for ii=1:length(flux)
        if a_l(ii)>=0
            flux(ii,:)=f_l(ii,:);
        elseif a_l(ii)<=0 && a_r(ii)>=0
            flux(ii,:)=(a_r(ii)*f_l(ii,:)-a_l(ii)*f_r(ii,:)+a_r(ii)*a_l(ii)*(u_r(ii,:)-u_l(ii,:)))/(a_r(ii)-a_l(ii));
        elseif a_r(ii)<=0
            flux(ii,:)=f_r(ii,:);
        end
    end    
%%%END_STUDENT

end

