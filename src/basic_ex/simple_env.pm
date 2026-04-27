mdp

formula at_edge = x = 0 | x = 4 | y = 0 | y = 4;

module robot

    x: [0..4] init 2; // current location on line
    y: [0..4] init 2;

    [left] !at_edge -> 0.9:(x'=x-1) + 0.1:(x'=x+1);
    [right] !at_edge -> 0.9:(x'=x+1) + 0.1:(x'=x-1);
    [down] !at_edge -> 0.9:(y'=y-1) + 0.1:(y'=y+1);
    [up] !at_edge -> 0.9:(y'=y+1) + 0.1:(y'=y-1);
    [] at_edge -> (x'=x)&(y'=y);
endmodule

label "safe" = !at_edge;
label "unsafe" = at_edge;