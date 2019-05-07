function inputs = PID_controller(anglesdot,dt)
    global para;
    m = para.m;
    g = para.g;
    k = para.k;
    
    kd = 4;
    kp = 3;
    ki = 5.5;
    
    if ~isfield(para, 'integral')
        para.integral = zeros(3,1);
        para.integral2 = zeros(3,1);
    end
    
    if max(abs(para.integral2) > 0.01)
        para.integral2(:) = 0;
    end
    
    integral = para.integral;
    integral2 = para.integral2;
    
    total = m * g / k / (cos(integral(1)) * cos(integral(2)));
    
    e =kd * anglesdot + kp * integral - ki * integral2;;
    
    inputs = error2inputs(e,total);
    
    integral = integral +dt * anglesdot;
    integral2 = integral2 +dt * integral; 
    
    para.integral = integral;
    para.integral2 = integral;



end