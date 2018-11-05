xrange=[-10 10];
yrange=[-10 10];

[X,Y] = synthetic_lin();
Y = Y*2-1;


model = ii_train_logress(X,Y);

decision_boundaries = decision_boundaries_vec(xrange, yrange, 1000, @(x) (ii_test_logress(model, x)>0.5)*2-1);

figure(2)
subplot 121
hold off
imagesc(xrange, yrange, decision_boundaries);
colormap([1 0.8 0.8; 0.9 0.9 1]);
hold on;
set(gca, 'ydir', 'normal');
plot(X(Y==-1,1),X(Y==-1,2),'r*')
plot(X(Y==1,1),X(Y==1,2),'bo')
title 'Logistic Regression'

xrange=[-2.5 2.5];
yrange=xrange;

[X,Y] = synthetic_nonlin();
Y = Y*2-1;
del_first_col = @(x)x(:,2:end);

model = ii_train_logress(del_first_col(x2fx(X,'quadratic')),Y);

decision_boundaries = decision_boundaries_vec(xrange, yrange, 1000, ...
    @(x) 1+(0.5<ii_test_logress(model,del_first_col(x2fx(x,'quadratic')))));

subplot 122
hold off
imagesc(xrange, yrange, decision_boundaries);
colormap([1 0.8 0.8; 0.9 0.9 1]);
hold on;
set(gca, 'ydir', 'normal');
plot(X(Y==-1,1),X(Y==-1,2),'r*')
plot(X(Y==1,1),X(Y==1,2),'bo')
title 'Logistic Regression (lifted)'