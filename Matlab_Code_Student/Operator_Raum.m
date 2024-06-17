% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [transport,source]=Operator_Raum(u,w,tstage,stage)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global nx                    % Anzahl an Zellen
    global dx                    % Zellbreite
    global nx_ghost              % Anzahl an zellen mit Ghostzellen
    global order_space           % raeumliche Konvergenzorndung
    global dt
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% Allocation 
transport=zeros(nx_ghost,3);

% Randbedingungen
[w]=Randbedingungen(w,tstage);
[u]=Prims2Cons(w);
if order_space==1       % keine Rekonstruktion
    w_left=w;
    w_right=w;
elseif order_space==2   % lineare Rekonstruktion und MINMOD Limitierung
    [jump]=Jump(u(1:nx_ghost-1,:),u(2:nx_ghost,:));
    grad=jump/dx;
    [u_left,u_right]=Reconstruction(u,grad);
    [w_left]=Cons2Prims(u_left);
    [w_right]=Cons2Prims(u_right);
    % Randbedingungen
    [w_left]=Randbedingungen(w_left,tstage);
    [w_right]=Randbedingungen(w_right,tstage);
end
% Konvektive Fluesse
[g_flux_convectiv]=Flux_Convectiv(w_left,w_right);
% Diffusive Fluesse
[g_flux_diffusiv]=Flux_Diffusiv(u,w);
% Gesammtfluss und Transport
g_flux=g_flux_convectiv+g_flux_diffusiv;
transport(2:nx_ghost-1,:)=1/dx*(g_flux(2:nx+1,:)-g_flux(1:nx,:));
% Quellterm
[source]=Source(u,w);

end
