function [ X, Y ] = synthetic_nonlin(  )
% generate synthetic data
n_samples = 100;
X_1 = randn(n_samples,2)/2;
[a,b]=pol2cart(rand(n_samples,1)*2*pi,randn(n_samples,1)/3+1.5);
X_2 = [a b];
X = [X_1; X_2];
Y = [ones(n_samples,1); 2*ones(n_samples,1)] - 1;
end

