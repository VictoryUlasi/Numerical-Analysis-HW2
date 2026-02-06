function [best_alt_ft, best_range_nmi] = p1_main()

altitudes = 10000:1000:40000;

% p1_main_breguet_range_sweep
% Sweeps altitudes from 10,000 to 40,000 ft in 1000 ft increments and finds
% the altitude that maximizes aircraft range using the Breguet range equation.

% Inputs:
%   None

% Outputs:
%   best_alt_ft      altitude (ft) that gives the maximum range
%   best_range_nmi   maximum range (nmi)
%
% Notes:
% - You MUST use the provided function names and input order exactly.
% - Each subfunction must be in their own matlab .m file

clc;

% --------- Instructor-specified L-1011 aircraft inputs ---------
Wto_lb   = 124*3456;     % aircraft total weight (lb)
Wfuel_lb = 0.352*Wto_lb; % aircraft fuel weight (lb)
V_kts    = 482;          % aircraft airspeed (knots)

AR  = 6.95;    % wing aspect ratio
e   = 0.606;   % wing Oswald efficiency factor
CD0 = 0.01809; % aircraft zero-lift drag coefficient

% --------- Atmosphere/constants --------------------------------
Re_ft      = 20925524.9;   % Earth radius (ft)
T0_R       = 518.67;       % sea-level temperature (Rankine)
h_trop_ft  = 36089.239;    % tropopause altitude (ft)
h_max_ft   = 65616.798;    % max altitude for model (ft)
T_iso_R    = 389.97;       % isothermal temperature (Rankine)
L_R_per_ft = 0.00356616;   % lapse-rate coefficient (deg R / ft of geopotential altitude)

gamma      = 1.4;          % specific heat ratio of air
R_air      = 1716.46;      % air gas constant ft*lbf/(slug*R)

kts_to_fts = 1.68781;      % conversion of knots to ft/sec

% --------- Altitude sweep: 10,000 to 40,000 ft ---------
% TODO create altitude array from 10000 to 40000 ft in 1000 ft
% incremements. Check your array in the command window

best_alt_ft = -1;
best_range_nmi = -1;

for a = altitudes
    h_ft = a;
    T_R = p1_get_T_R(h_ft,Re_ft,h_trop_ft,h_max_ft,T0_R,L_R_per_ft,T_iso_R);
    theta = T_R / T0_R;
    M = p1_get_mach(V_kts,T_R,gamma,R_air,kts_to_fts);
    tsfc = p1_get_tsfc(M , theta);
    LODmax = p1_get_max_LOD(AR , e , CD0);
    Rnmi = p1_get_range(V_kts , tsfc , LODmax , Wto_lb , Wfuel_lb);

    if Rnmi > best_range_nmi
        best_range_nmi = Rnmi;
        best_alt_ft = a;
    end
end
% for loop begins

    %TODO get the current altitude from the array of altitudes

    % 1) Temperature (Rankine) - function required
    % TODO get T_R from p1_get_T_R

    % 2) Theta temperature ratio - no function required
    % TODO: compute theta = T_R / T0_R

    % 3) Mach number - function required
    % TODO get M from p1_get_mach

    % 4) TSFC - function required
    % TODO get tsfc from p1_get_tsfc

    % 5) (L/D)_max - function required
    % TODO get L/Dmax from p1_get_max_LOD

    % 6) Range - function required
    % TODO get range from p1_get_range

    % TODO: update best_range_nmi and best_alt_ft if the current altitude is better

%end of for loop

end












