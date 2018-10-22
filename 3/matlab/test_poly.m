rng(42) % seed random number generator
sigma=0.05;
cc = lines(5);
degrees = [0 1 3 9];
figure(3)
hold off

subplot_tight(1,1,1,[0.1,0.1])
timeseries = csvread('./materials/timeseries.csv');
x = timeseries(2, :)';
y = timeseries(1, :)';

scatter(x,y,'k');
hold on

for i=1:numel(degrees)
    theta = ii_fit_poly(x,y,degrees(i));
    estimated_y = ii_apply_poly(theta, x);
    plot(x, estimated_y,'color', cc(1+i,:));
end
    
%axis([-0.1 1.1 -0.1 1.1])
hold off
legend('Data', 'Degree 0', ...
    'Degree 1', 'Degree 3', 'Degree 9',...
    'Location', 'SouthEast')
title 'Poly fit'
