s=2.5;
xrange=[-s s];
yrange=xrange;

% generate synthetic data
[X,Y] = synthetic_nonlin();

decision_func = fitcknn(X, Y, 'NumNeighbors', 3);

decision_boundaries = decision_boundaries_vec(xrange, yrange, 1000, ...
                                              decision_func);

figure(1)
hold off
imagesc(xrange, yrange, decision_boundaries);
colormap([1 0.8 0.8; 0.9 0.9 1]);
hold on;
set(gca, 'ydir', 'normal');
plot(X(Y==1,1),X(Y==1,2),'r*')
plot(X(Y==0,1),X(Y==0,2),'bo')
title 'KNN (K=3)'
