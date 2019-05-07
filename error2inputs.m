function inputs = error2inputs(e,total)
    global para;
    b = para.b;
    k = para.k;
    L = para.L;
    Ix = para.I(1,1);
    Iy = para.I(2,2);
    Iz = para.I(3,3);
    
    e1 = e(1);
    e2 = e(2);
    e3 = e(3);
    
    inputs = zeros(4,1);
    
    inputs(1) = total / 4 - (2 * b * e1 * Ix + e3 * Iz * k * L) / (4 * b * k * L);
    inputs(2) = total / 4 + e3 * Iz / (4 * b) - (e2 * Iy) / (2 * k * L);
    inputs(3) = total / 4 - (-2 * b * e1 * Ix + e3 * Iz * k * L) / (4 * b * k * L);
    inputs(4) = total / 4 + e3 * Iz / (4 * b) + e2 * Iy / (2 * k * L);


end