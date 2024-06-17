% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [var]=EOS_Ideal(u,w,T,e,which_var)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global kappa                 % Isentropenkoeffizient
    global R                     % ideale spezifische Gaskonstante
    
    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

if which_var==1         % Innere Energy (volumenspezifisch)
        
  var=w(:,3)/(kappa-1);
        
elseif which_var==2     % Temperatur
        
  var=w(:,3)./w(:,1)/R;
  
elseif which_var==3     % Druck

  var=(kappa-1)*e(:,1);

elseif which_var==4     % Dichte

  var=w(:,3)./R./T(:,1);  
    
end
        
end

