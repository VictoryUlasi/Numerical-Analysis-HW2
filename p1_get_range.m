function Rnmi = p1_get_range(V_kts , tsfc , LDmax , Wto_lb , Wfuel_lb)

Wf = Wto_lb - Wfuel_lb;

Rnmi = (V_kts / tsfc) * (LDmax) * log(Wto_lb/Wf);

%change "output" and "inputs" to your variables
% p1_get_range
% Computes Breguet range in nautical miles (nmi).

% Inputs (order matters):
%   (1) V_kts
%   (2) tsfc
%   (3) LDmax
%   (4) Wto_lb
%   (5) Wfuel_lb

% Output:
%   Rnmi

% TODO:
% 1) compute final weight Wf = Wto_lb - Wfuel_lb
% 2) compute range using natural log (log in MATLAB)

end
