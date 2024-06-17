% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Main

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global t_end                 % Ende der Simulation
    global animation             % Animation Flag
    global datenausgabe          % Datenausgabe Flag
    global iter_animation        % Iterationsintervall Animation
    global iter_datenausgabe     % Iterationsintervall Datenausgabe
    global dt_animation          % Zeitschrittintervall Animation
    global dt_datenausgabe       % Zeitschrittintervall Datenausgabe

    % out------------------------------------------------------------------
    
    % inout----------------------------------------------------------------
    
    global u                     % Konservative Variablen [rho rhov e]
    global w                     % Primitive Variablen    [rho  v   p]
    global t                     % Simulationszeit
    global dt                    % Zeitschritt
    global measuretime           % Computation Time
    global simtime               % Simulation Time
    
%--------------------------------------------------------------------------

% Initialisierung

Initialisierung;

% Zeitschleife

t=0;
i=0;
i_animation=i+iter_animation;
i_datenausgabe=i+iter_datenausgabe;
t_animation=t+dt_animation;
t_datenausgabe=t+dt_datenausgabe;
simtime=0;
[vars_analyse]=Analyse(u,w,t,i);
Animation(vars_analyse,t,i)
tic
while t<t_end
    [dt]=CFL(w);
    if t+dt>t_end
        dt=t_end-t;
    end
    [u,w]=Operator_Zeit(u,w,t,dt);
    t=t+dt;
    i=i+1;
    if (animation==1 && i==i_animation) || ...
       (animation==1 && t>=t_animation) || t==t_end
        [vars_analyse]=Analyse(u,w,t,i);
        Animation(vars_analyse,t,i)
        if i==i_animation
            i_animation=i_animation+iter_animation;
        end
        if t>=t_animation
            t_animation=t_animation+dt_animation;
        end
        measuretime=toc;tic;Computertime(t,i);
    end
    if (datenausgabe==1 && i==i_datenausgabe) || ...
       (datenausgabe==1 && t>=t_datenausgabe) || t==t_end
        Datenausgabe(u,w,t,i)
        if i==i_datenausgabe
            i_datenausgabe=i_datenausgabe+iter_datenausgabe;
        end
        if t>=t_datenausgabe
            t_datenausgabe=t_datenausgabe+dt_datenausgabe;
        end
    end
end

end
