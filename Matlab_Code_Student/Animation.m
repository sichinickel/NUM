% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Animation(vars_analyse,t,i)

% Globale Variablen--------------------------------------------------------

    global a                     % Domaingrenze links
    global b                     % Domaingrenze rechts
    global x_Center              % Zellmitten

    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
%--------------------------------------------------------------------------

% Visualisierung
subplot(2,2,1);
plot(x_Center(2:end-1),vars_analyse(2:end-1,1));
axis([a,b,min(vars_analyse(2:end-1,1))-0.2,max(vars_analyse(2:end-1,1))+0.2]);
xlabel('x');
subplot(2,2,2);
plot(x_Center(2:end-1),vars_analyse(2:end-1,2));
axis([a,b,min(vars_analyse(2:end-1,2))-0.2,max(vars_analyse(2:end-1,2))+0.2]);
xlabel('x');
subplot(2,2,3);
plot(x_Center(2:end-1),vars_analyse(2:end-1,3));
axis([a,b,min(vars_analyse(2:end-1,3))-0.2,max(vars_analyse(2:end-1,3))+0.2]);
xlabel('x');
subplot(2,2,4);
plot(x_Center(2:end-1),vars_analyse(2:end-1,4));
axis([a,b,min(vars_analyse(2:end-1,4))-0.2,max(vars_analyse(2:end-1,4))+0.2]);
xlabel('x');

% Legende
Legende(t,i);

getframe;

end
