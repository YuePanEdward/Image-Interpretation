rng(13) % seed random number generator
sigma=0.05;
cc=lines(5);
maxdegree = 9;
figure(5)
hold off
%% linear function
subplot_tight(1,2,1,[0.1,0.1])
x=noisy((0:0.1:1)', sigma);
f=@(x)0.3*x+0.6;
y=noisy(f(x),sigma);
scatter(x,y,'k');
hold on
test_x = (-0.1:0.01:1.1)';
true_y = f(test_x);
plot(test_x, true_y, 'color', cc(1,:));
theta = ii_fit_poly(x,y,maxdegree);
estimated_y = ii_apply_poly(theta, test_x);
plot(test_x, estimated_y,'color', cc(2,:));
theta = ii_fit_poly_crossval(x,y,maxdegree);
estimated_y = ii_apply_poly(theta, test_x);
plot(test_x, estimated_y,'color', cc(3,:));

disp(sprintf('True degree 1, estimated degree %d', numel(theta)-1))

axis([-0.1 1.1 -0.1 1.1])
hold off
legend('Data', 'True Function', ...
    'No Crossval', 'Crossval',...
    'Location', 'SouthEast')
title 'Linear Function'

%% cubic function
subplot_tight(1,2,2,[0.1,0.1])
x=noisy((0:0.05:1)', sigma);
f=@(x)x.^3-x.^2+0.5;
y=noisy(f(x),sigma);
scatter(x,y,'k');
hold on
test_x = (-0.1:0.01:1.1)';
true_y = f(test_x);
plot(test_x, true_y, 'color', cc(1,:));
theta = ii_fit_poly(x,y,maxdegree);
estimated_y = ii_apply_poly(theta, test_x);
plot(test_x, estimated_y,'color', cc(2,:));
theta = ii_fit_poly_crossval(x,y,maxdegree);
estimated_y = ii_apply_poly(theta, test_x);
plot(test_x, estimated_y,'color', cc(3,:));
    
disp(sprintf('True degree 3, estimated degree %d', numel(theta)-1))

axis([-0.1 1.1 -0.1 1.1])
hold off
legend('Data', 'True Function', ...
    'No Crossval', 'Crossval',...
    'Location', 'SouthEast')
title 'Cubic Function'