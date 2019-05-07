function R = ZXZ_rotation(angles)
    phi = angles(1);
    theta = angles(2);
    psi = angles(3);
    
    R = zeros(3);
    
%     R = [
%            cos(phi) * cos(psi) - cos(theta) * sin(phi) * sin(psi),          -cos(psi) * sin(phi) - cos(phi) *  cos(theta) * sin(psi),          sin(theta) * sin(psi);
%            cos(theta) * cos(psi) * sin(phi) + cos(phi) * sin(psi),         cos(phi) * cos(theta) * cos(psi) - sin(phi) * sin(psi),             -cos(psi) * sin(theta);
%            sin(phi) * sin(theta),                                                          cos(phi) * sin(theta),                                                             cos(theta)
%            ];

    R = [
           cos(phi) * cos(theta),                                                        cos(psi) * sin(theta) * sin(psi) - cos(psi) *  sin(phi),              sin(psi) * sin(phi) + cos(phi) * cos(psi) * sin(theta);
           cos(theta) * sin(phi),                                                         cos(phi) * cos(psi) + sin(phi) - sin(theta) * sin(psi),             cos(psi) * sin(phi) * sin(theta) - cos(phi) * sin(psi);
           -sin(theta),                                                                        cos(theta) * sin(psi),                                                             cos(theta) * cos(psi)
           ];
end