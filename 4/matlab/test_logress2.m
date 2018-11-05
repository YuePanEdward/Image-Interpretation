[img, gt] = load_graz(0.5);

[sy, sx, nc] = size(img);

X=create_features(img);

train_columns = sx/4;

true_class = 1;

Y=(gt==true_class)*2-1;

used_train = train_columns * sy;

Y=reshape(Y,[sy*sx 1]);

model  = ii_train_logress(X(1:used_train,:),Y(1:used_train,:));
results = ii_test_logress(model, X);
results = reshape(results,[sy sx]) > 0.5;

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
