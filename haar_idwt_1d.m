function x_rec = haar_idwt_1d(cA, cD)
    cA = cA(:)';
    cD = cD(:)';
    N = length(cA);

    upA = zeros(1, 2 * N); upA(1:2:end) = cA;
    upD = zeros(1, 2 * N); upD(1:2:end) = cD;

    g0 = [1 1] / sqrt(2);
    g1 = [-1 1] / sqrt(2);

    recA = conv(upA, g0, 'full');
    recD = conv(upD, g1, 'full');

    x_rec = recA(1:2*N) + recD(1:2*N);
endfunction


