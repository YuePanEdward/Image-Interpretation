[img, gt] = load_graz(0.5);

[sy, sx, nc] = size(img);

X=create_features(img);

train_columns = sx/4;

true_class = 1;

Y=(gt==true_class)+1;

used_train = train_columns * sy;

Y=reshape(Y,[sy*sx 1]);
decision_func = fitcknn(X(1:used_train, :), Y(1:used_train,:), 'NumNeighbors', 2);
results_test = predict(decision_func, X(used_train+1:sy*sx, :));
results = cat(1, Y(1:used_train,:), results_test);
results = reshape(results,[sy sx]);

figure(1)
subplot 122
hold off
imagesc(results)
axis image
axis off
colormap gray
title Results
subplot 121
hold off
imagesc(reshape(Y,[sy sx]))
axis image
axis off
colormap gray
title Original
truesize