xrange=[-10 10];
yrange=[-10 10];

[X,Y] = synthetic_lin();
Y=Y*2-1;

model = ii_train_tree(X,Y);
decision_boundaries = decision_boundaries_vec(xrange, yrange, 1000, @(x) ii_test_tree(model, x));

figure(3)
subplot 121
hold off
imagesc(xrange, yrange, decision_boundaries);
colormap([1 0.8 0.8; 0.9 0.9 1]);
hold on;
set(gca, 'ydir', 'normal');
plot(X(Y==-1,1),X(Y==-1,2),'r*')
plot(X(Y==1,1),X(Y==1,2),'bo')
title 'Tree'

xrange=[-2.5 2.5];
yrange=xrange;

[X,Y] = synthetic_nonlin();
Y=Y*2-1;

model = ii_train_tree(X,Y);
decision_boundaries = decision_boundaries_vec(xrange, yrange, 1000, @(x) ii_test_tree(model, x));

subplot 122
hold off
imagesc(xrange, yrange, decision_boundaries);
colormap([1 0.8 0.8; 0.9 0.9 1]);
hold on;
set(gca, 'ydir', 'normal');
plot(X(Y==-1,1),X(Y==-1,2),'r*')
plot(X(Y==1,1),X(Y==1,2),'bo')
title 'Tree'

view(model,'mode','graph');
