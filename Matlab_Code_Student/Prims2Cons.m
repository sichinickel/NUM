% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [u] = Prims2Cons(w)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global Handle_EOS            % Funktionshandle für EOS 
    
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% volumenspezifische innere Energie

[e]=Handle_EOS([],w,[],[],1);

u(:,1)=w(:,1);
u(:,2)=w(:,2).*w(:,1);     
u(:,3)=e(:,1)+0.5*w(:,1).*w(:,2).^2;

end

