[img, gt] = load_graz(0.5);

[sy, sx, nc] = size(img);

X=create_features(img);
%X=create_features(img, ii_gaussian(img, 7));

train_columns = sx/4;

true_class = 3;

Y=(gt==true_class);

used_train = train_columns * sy;

Y=reshape(Y,[sy*sx 1]);

[normal, threshold] = ii_train_lda(X(1:used_train,:),Y(1:used_train,:));

results=ii_test_lda(X,normal, threshold);

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
