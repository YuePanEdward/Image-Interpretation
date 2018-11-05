[img, gt] = load_graz(0.5);

[sy, sx, nc] = size(img);

X=create_features(img);
%X=create_features(img, ii_gaussian(img, 7));

train_columns = sx/4;

true_class = 1;

Y=gt;

used_train = train_columns * sy;

Y=reshape(Y,[sy*sx 1]);

tree = ii_train_tree(X(1:used_train,:),Y(1:used_train,:));

results=ii_test_tree(tree, X);

results = reshape(results,[sy sx]);

figure(1)
subplot 122
hold off
imagesc(results)
axis image
axis off
colormap([0 0 0; 0.8 0.8 0.8; 0.2 0.6 0.2]);
title Results
subplot 121
hold off
imagesc(reshape(Y,[sy sx]))
axis image
axis off
colormap([0 0 0; 0.8 0.8 0.8; 0.2 0.6 0.2]);
title Original
truesize
