mdp

module robot

    s: [0..4] init 2; // current location on line

    [left] s < 4 & s > 0 -> 0.9:(s'=s-1) + 0.1:(s'=s+1);
    [right] s < 4 & s > 0 -> 0.9:(s'=s+1) + 0.1:(s'=s-1);
    [] s = 0 -> (s'=s);
    [] s = 4 -> (s'=s);
endmodule