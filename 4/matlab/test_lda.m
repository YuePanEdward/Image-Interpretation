xrange=[-10 10];
yrange=[-10 10];

[X,Y] = synthetic_lin();

[normal, threshold] = ii_train_lda(X,Y);

decision_boundaries = decision_boundaries_vec(xrange, yrange, 1000, @(x) ii_test_lda(x, normal, threshold));

figure(2)
subplot 121
hold off
imagesc(xrange, yrange, decision_boundaries);
colormap([1 0.8 0.8; 0.9 0.9 1]);
hold on;
set(gca, 'ydir', 'normal');
plot(X(Y==0,1),X(Y==0,2),'r*')
plot(X(Y==1,1),X(Y==1,2),'bo')
title LDA

xrange=[-2.5 2.5];
yrange=xrange;

[X,Y] = synthetic_nonlin();
del_first_col = @(x)x(:,2:end);

[normal, threshold] = ii_train_lda(del_first_col(x2fx(X,'quadratic')),Y);

decision_boundaries = decision_boundaries_vec(xrange, yrange, 1000, ...
    @(x) ii_test_lda(del_first_col(x2fx(x,'quadratic')), normal, threshold));

subplot 122
hold off
imagesc(xrange, yrange, decision_boundaries);
colormap([1 0.8 0.8; 0.9 0.9 1]);
hold on;
set(gca, 'ydir', 'normal');
plot(X(Y==0,1),X(Y==0,2),'r*')
plot(X(Y==1,1),X(Y==1,2),'bo')
title 'LDA (lifted)'