% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Testcase_States

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global testcase              % Testcase (Anfangswertproblem)
    global nx
    
    % out------------------------------------------------------------------
    
    global u_states              % Conservative Statevektor
    global w_states              % Primitive Statevektor
    global String_Problem        % Name des Testcases    
    global state_type            % Definition des Statetyps
    global n_states              % Anzahl an States
    global testcase_function     % Funktion für Anfangswertbedingung
    global boundary_condition    % Randbedingung
    
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% EOS
EOS_Data;

% States
if testcase==1
    String_Problem='Lax-Shock-Tube';
    n_states=2;
    state_type=2;
    testcase_function=2;
    boundary_condition(1)=1;
    boundary_condition(2)=1;
    
%%%START_STUDENT
global kappa
for ii=1:nx
    if (ii/nx)<=0.5
        r(ii)=0.44;
        vx(ii)=0.71;
        p(ii)=3.5;
    else
        r(ii)=0.52;
        vx(ii)=0;
        p(ii)=0.6;
    end
end
ix= p.*vx;
e= (p/(kappa-1))+0.5*r.*vx.^2;
%%%END_STUDENT
 
else
    error('No such testcase implemented');
end

% States
switch state_type
    case{1} % Konservative Variablen
        u_states(:,1)=r(:);
        u_states(:,2)=ix(:);
        u_states(:,3)=e(:);
        [w_states]=Cons2Prims(u_states);
    case{2} % Primitve Variablen
        w_states(:,1)=r(:);
        w_states(:,2)=vx(:);
        w_states(:,3)=p(:);
        [u_states]=Prims2Cons(w_states);
end

end

