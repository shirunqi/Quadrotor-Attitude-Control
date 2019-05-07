function a = acceleration(inputs,angles,xdot)
    global para;
    g = para.g;
    m = para.m;
    k = para.k;
    kd = para.kd;
    
    G = [0;0;-g];
    R = ZXZ_rotation(angles);
    TB = thrust(inputs,k);
    T = R * TB;
    FD = -kd * xdot;
    
    a = G + 1 / m * T + FD;



end