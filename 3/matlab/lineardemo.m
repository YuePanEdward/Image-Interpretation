%% regression
% input values
X=(0:10)'
% target results
Y=0.5+0.3*X+randn(size(X))*0.2
% show raw values
figure(1)
hold off
scatter(X,Y)
% extend with ones
X_ex=[ones(size(X,1),1) X]
% determine optimal parameters
theta = X_ex\Y

%% plot fit line
% plot at -1 and 11 - 2 points sufficient for a line
X2 = [-1;11]
% for testing, again extend
X2_ex = [ones(size(X2,1),1) X2]
% determine y values
Y2 = X2_ex * theta

hold on
plot(X2,Y2)