function [ X,Y ] = synthetic_lin(  )
S=[10 0; 0 5];
[X,Y] = two_gaussians(50,[-4 0],[4 0], rotate_base(S,pi/4),rotate_base(S,pi/3));
end

