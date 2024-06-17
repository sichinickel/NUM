% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function [vars_analyse]=Analyse(u,w,t,i)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
    
    global plotvar               % Flag für u oder w Visualisierung
    global n_var                 % Anzahl an Variablen im System
    global nx_ghost              % Anzahl an zellen mit Ghostzellen
    global Handle_EOS            % Funktionshandle für EOS 

    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

% Allocating
vars_analyse=zeros(nx_ghost,n_var);
tx=zeros(nx_ghost,1);

% Analyse
mass_density(:,1)=w(:,1);
velocity(:,1)=w(:,2);
pressure(:,1)=w(:,3);
impuls_density(:,1)=u(:,2);
energy_density(:,1)=u(:,3);
[temperatur(:,1)]=Handle_EOS(u,w,[],[],2);   
[tx(2:nx_ghost-1,1)]=Gradient(temperatur(:,1));

if plotvar==1
    vars_analyse(:,1)=mass_density(:,1);
    vars_analyse(:,2)=impuls_density(:,1);
    vars_analyse(:,3)=energy_density(:,1);
	vars_analyse(:,4)=temperatur(:,1);
elseif plotvar==2
    vars_analyse(:,1)=mass_density(:,1);
    vars_analyse(:,2)=velocity(:,1);
    vars_analyse(:,3)=pressure(:,1);
	vars_analyse(:,4)=tx(:,1);
end

end

