function [ out ] = noisy( in, sigma )
%NOISY Summary of this function goes here
%   Detailed explanation goes here
if nargin < 2
    sigma = 0.1;
end

out = in + randn(size(in))*sigma;

end

