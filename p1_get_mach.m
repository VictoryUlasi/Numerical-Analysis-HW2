function M = p1_get_mach(V_kts,T_R,gamma,R_air,kts_to_fts) 
a = p1_get_sos(T_R , gamma , R_air );

if (V_kts < 0)
M = -1;
return;
else 
    M = (V_kts * kts_to_fts) / (a);

%change "output" and "inputs" to your variables
% p1_get_mach

% Inputs (order matters):
%   (1) V_kts
%   (2) T_R
%   (3) gamma
%   (4) R_air
%   (5) kts_to_fts

% Output:
%   M (Mach number), or -1 if V_kts < 0

% TODO Return -1 if velocity is negative. For example:
% if V_kts < 0
%     M = -1;
%     return;
% end

% TODO:
% 1) call p1_get_sos() to compute speed of sound a (ft/s)
% 2) convert V_kts to ft/s using kts_to_fts
% 3) compute Mach = V_ftps / a

end
