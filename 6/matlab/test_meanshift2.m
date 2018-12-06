true_cn = randi([8, 12], 1);
spread = 5*rand(1)+1;
obj = gmdistribution(randn(true_cn,2)*spread,repmat(eye(2),[1 1 true_cn]), ones(1,true_cn)/true_cn);
X = random(obj, 800);
[idx, centers] = ii_meanshift(X, 5, 0.001);

figure(1)
hold off
scatter(X(:,1),X(:,2),[],idx)
colormap(hsv(size(centers,1)))
hold on
plot(centers(:,1),centers(:,2),'kx', 'MarkerSize', 12,'LineWidth', 2)
plot(centers(:,1),centers(:,2),'ko', 'MarkerSize', 12,'LineWidth', 2)