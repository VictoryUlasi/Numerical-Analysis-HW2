function T_R = p1_get_T_R(h_ft,Re_ft,h_trop_ft,h_max_ft,T0_R,L_R_per_ft,T_iso_R)

Z = (Re_ft*h_ft) / (Re_ft+h_ft);

if(~(h_ft < 0) && ~(h_ft > h_max_ft))
    if (h_ft >= 0) && (h_ft <= h_trop_ft)
        T_R = T0_R - (L_R_per_ft * Z);
        return
    elseif (h_ft >= 0) && (h_ft <= h_max_ft)
        T_R = T_iso_R;
        return
    end
else
    T_R = -1;
    return
end
end  

%change "output" and "inputs" to your variables
% p1_get_T_R
% Computes temperature in Rankine using geopotential altitude.

% Inputs (order matters), you can use your own variable names:
%   (1) h_ft
%   (2) Re_ft
%   (3) h_trop_ft
%   (4) h_max_ft
%   (5) T0_R
%   (6) L_R_per_ft
%   (7) T_iso_R

% Output:
%   T_R (Rankine), or -1 if h_ft is out of bounds

% bounds check (required)
% TODO: if h_ft < 0 or h_ft > h_max_ft, return T_R = -1

% TODO:
% 1) compute geopotential altitude Z
% 2) if h_ft <= h_trop_ft, compute troposphere temperature
% 3) else return isothermal temperature
