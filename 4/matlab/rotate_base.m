function [ out ] = rotate_base( mat, ang )

R=[cos(ang) sin(ang);
  -sin(ang) cos(ang)];
out = R'*mat*R;


end

