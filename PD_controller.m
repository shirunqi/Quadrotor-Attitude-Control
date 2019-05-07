function inputs = PD_controller(anglesdot,dt)
    global para;
    m = para.m;
    g = para.g;
    k = para.k;
    
    kd = 4;
    kp = 3;
    
    if ~isfield(para, 'integral')
        para.integral = zeros(3,1);
    end
    
    integral = para.integral;
    
    total = m * g / k / (cos(integral(1)) * cos(integral(2)));
    
    e =kd * anglesdot + kp * integral;
    
    inputs = error2inputs(e,total);
    
    para.integral = integral +dt * anglesdot; 



end