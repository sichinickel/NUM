% IAG - Institut fuer Aerodynamic und Gasdynamik - Universitaet Stuttgart

function Initialisierung

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    % out------------------------------------------------------------------

    global String_Foldername     % Name des aktuellen Ordners
    global scrsz                 % Displayaufloesung
    global figure_main           % Figure ID
        
    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% Abfrage Bildschirmaufloesung
scrsz=get(0,'ScreenSize');

% Ordner fuer Datenausgabe erstellen
if exist('Daten','dir')==0
    % ---
elseif exist('Daten','dir')==7
    cd Daten
    % Daten in Ordner loeschen
    delete('*.mat')
    cd ..
else
    mkdir('Daten');
end

% Prepoc
Preproc;

% Funktions- and Objekthandles
Handle;

% Diskretisierung
Diskretisierung;

% Testcase
Testcase;

% Visualisierung
String_Foldername=strsplit(pwd,'/');
format short

figure_main=figure('Name',['Navier-Stokes-Equation: ', String_Foldername{end}],...
       'NumberTitle','off','Position',[2*scrsz(3)/24 2*scrsz(4)/24 19*scrsz(3)/24 15*scrsz(4)/24]);

end
