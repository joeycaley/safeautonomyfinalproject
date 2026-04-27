mdp

module robot

    x: [0..4] init 2; // current location on line
    y: [0..4] init 2;

    [left] x < 4 & x > 0 -> 0.9:(x'=x-1) + 0.1:(x'=x+1);
    [right] x < 4 & x > 0 -> 0.9:(x'=x+1) + 0.1:(x'=x-1);
    [down] y < 4 & y > 0 -> 0.9:(y'=y-1) + 0.1:(y'=y+1);
    [up] y < 4 & y > 0 -> 0.9:(y'=y+1) + 0.1:(y'=y-1);
    [] x = 0 | x = 4 | y = 0 | y = 4 -> (x'=x)&(y'=y);
endmodule