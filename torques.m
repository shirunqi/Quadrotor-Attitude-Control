function tau = torques(inputs,L,k,b)
    tau = [
              L * k * (inputs(1) - inputs(3));
              L * k * (inputs(2) - inputs(4));
              b * (inputs(1) - inputs(2) + inputs(3) - inputs(4))
              ];



end