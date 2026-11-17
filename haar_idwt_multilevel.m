function x_rec = haar_idwt_multilevel(coeffs, lengths)
    cA = coeffs(1:lengths(1));
    idx = lengths(1) + 1;

    for i = 2:length(lengths)
        len = lengths(i);
        cD = coeffs(idx : idx + len - 1);
        cA = haar_idwt_1d(cA, cD);
        idx = idx + len;
    end
    x_rec = cA;
endfunction


