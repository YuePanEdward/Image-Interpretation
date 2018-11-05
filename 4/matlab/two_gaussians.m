function [ X, Y ] = two_gaussians( samples_per_gaussian, m1, m2, S1, S2 )
Y=ones(samples_per_gaussian*2,1);
Y(end-samples_per_gaussian+1:end)=0;
X=[mvarnormal(samples_per_gaussian,S1,m1);
   mvarnormal(samples_per_gaussian,S2,m2)];
end