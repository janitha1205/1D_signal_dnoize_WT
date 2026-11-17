% --- 1. 1D Forward & Inverse Haar DWT ---
function [cA, cD] = haar_dwt_1d(x)
    x = x(:)';
    h0 = [1 1] / sqrt(2);
    h1 = [1 -1] / sqrt(2);

    tempA = conv(x, h0, 'full');
    cA = tempA(2:2:end-1);

    tempD = conv(x, h1, 'full');
    cD = tempD(2:2:end-1);
endfunction



