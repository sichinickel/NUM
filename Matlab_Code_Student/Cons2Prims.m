% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [w] = Cons2Prims(u)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global Handle_EOS            % Funktionshandle für EOS 
   
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% volumenspezifische innere Energie

e(:,1)=u(:,3)-0.5*u(:,2).^2./u(:,1); 

w(:,1)=u(:,1);
w(:,2)=u(:,2)./u(:,1);   
[w(:,3)]=Handle_EOS(u,[],[],e,3);

end
