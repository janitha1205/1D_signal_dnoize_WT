% --- 2. Multi-Level Forward & Inverse Helpers ---
function [coeffs, lengths] = haar_dwt_multilevel(x, levels)
    coeffs = [];
    lengths = [];
    current_signal = x(:)';

    for i = 1:levels
        [cA, cD] = haar_dwt_1d(current_signal);
        coeffs = [cD, coeffs];
        lengths = [length(cD), lengths];
        current_signal = cA;
    end
    coeffs = [current_signal, coeffs];
    lengths = [length(current_signal), lengths];
endfunction


