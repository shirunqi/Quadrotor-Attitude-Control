function omegadot = angular_acceleration(inputs,omega)
    global para;
    I = para.I;
    L = para.L;
    k = para.k;
    b = para.b;
    
    tau = torques(inputs,L,k,b);
    
    omegadot = inv(I) * (tau - cross(omega, I * omega));


end