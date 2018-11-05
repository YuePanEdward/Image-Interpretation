function [ data ] = mvarnormal( numelements, Sigma, mu )
%MVARNORMAL Summary of this function goes here
%   Detailed explanation goes here

R = chol(Sigma);
data = repmat(mu, numelements, 1);
data = data + randn(numelements, length(mu)) * R;

end

