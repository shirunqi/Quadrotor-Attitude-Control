function  i = input_wi(t)
    i = zeros(4,1);
    i(:) = 700;
    i(1) = i(1) + 150;
    i(3) = i(3) + 150;
    i = i .^ 2;

end