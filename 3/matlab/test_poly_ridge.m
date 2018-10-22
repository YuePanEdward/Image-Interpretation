rng(42) % seed random number generator
sigma=0.05;
cc = lines(5);
degree = 9;
lambdas = [0 1e-7 1e-3, 1];
figure(3)
hold off

subplot_tight(1,1,1,[0.1,0.1])
timeseries = csvread('./materials/timeseries.csv');
x = timeseries(2, :)';
y = timeseries(1, :)';

scatter(x,y,'k');
hold on

for i=1:numel(lambdas)
    theta = ii_fit_poly_ridge(x,y,degree, lambdas(i));
    estimated_y = ii_apply_poly(theta, x);
    plot(x, estimated_y,'color', cc(1+i,:));
end
    
%axis([-0.1 1.1 -0.1 1.1])
hold off
legend('Data', ...
    'Lambda=0', 'Lambda=10^{-7}', 'Lambda=10^{-3}', 'Lambda=1',...
    'Location', 'SouthEast')
title 'Ridge poly fit'
