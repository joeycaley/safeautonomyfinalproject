mdp

const int N = 10;

formula danger_zones = (x=0 & y=0)| (x=1 & y=2);

module robot

    x: [0..N] init N/2;
    y: [0..N] init N/2;

    // standard cases
    [left] x>0 -> 0.9:(x'=x-1) 
                + 0.05:(x'=x-1)&(y'=y+1) 
                + 0.05:(x'=x-1)&(y'=y-1);
    [right] x<N -> 0.9:(x'=x+1) 
                + 0.05:(x'=x+1)&(y'=y+1) 
                + 0.05:(x'=x+1)&(y'=y-1);
    [up] y<N -> 0.9:(y'=y+1) 
                + 0.05:(x'=x-1)&(y'=y+1) 
                + 0.05:(x'=x+1)&(y'=y+1);
    [down] y>0 -> 0.9:(y'=y-1) 
                + 0.05:(x'=x-1)&(y'=y-1) 
                + 0.05:(x'=x+1)&(y'=y-1);

    // edge cases TODO redefine how other moves go (ex up on left edge can't go left at all!)
    [left] x=0 -> (x'=x)&(y'=y);
    [right] x=N -> (x'=x)&(y'=y);
    [up] y<N -> (x'=x)&(y'=y);
    [down] y>0 -> (x'=x)&(y'=y);

    // TODO define (literal) corner cases
endmodule

label "unsafe" = danger_zones;


// controller
const int a0 = 1;  // 1=right, 2=left, 3=up, 4=down
const int a1 = 1;
const int a2 = 3;
const int a3 = 3;
const int a4 = 2;

formula current_action =
    step = 0 ? a0 :
    step = 1 ? a1 :
    step = 2 ? a2 :
    step = 3 ? a3 :
    step = 4 ? a4 : 0;

module controller
    step : [0..5] init 0;
    
    [right] step = 0 & a0 = 1 -> (step'=step+1);
    [left]  step = 0 & a0 = 2 -> (step'=step+1);
    [up]    step = 0 & a0 = 3 -> (step'=step+1);
    [down]  step = 0 & a0 = 4 -> (step'=step+1);
    
    [right] step = 1 & a1 = 1 -> (step'=step+1);
    [left]  step = 1 & a1 = 2 -> (step'=step+1);
    [up]    step = 1 & a1 = 3 -> (step'=step+1);
    [down]  step = 1 & a1 = 4 -> (step'=step+1);
    
    [right] step = 2 & a2 = 1 -> (step'=step+1);
    [left]  step = 2 & a2 = 2 -> (step'=step+1);
    [up]    step = 2 & a2 = 3 -> (step'=step+1);
    [down]  step = 2 & a2 = 4 -> (step'=step+1);
    
    [right] step = 3 & a3 = 1 -> (step'=step+1);
    [left]  step = 3 & a3 = 2 -> (step'=step+1);
    [up]    step = 3 & a3 = 3 -> (step'=step+1);
    [down]  step = 3 & a3 = 4 -> (step'=step+1);
    
    [right] step = 4 & a4 = 1 -> (step'=step+1);
    [left]  step = 4 & a4 = 2 -> (step'=step+1);
    [up]    step = 4 & a4 = 3 -> (step'=step+1);
    [down]  step = 4 & a4 = 4 -> (step'=step+1);
    
    [done]  step = 5 -> (step'=5);
endmodule