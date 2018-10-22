image1=im2double(imread('image-with-blue.png'));
image2=im2double(imread('image-without-blue.png'));

image1_red   = image1(:,:,1);
image1_green = image1(:,:,2);
image1_blue  = image1(:,:,3);

image2_ir    = image2(:,:,1);
image2_red   = image2(:,:,2);
image2_green = image2(:,:,3);

image1_blueconst = cat(3,image1_red,image1_green,ones(size(image1_red))/2);
image1_blueavg   = cat(3,image1_red,image1_green,(image1_green+image1_red)/2);
image2_blueconst = cat(3,image2_red,image2_green,ones(size(image2_red))/2);
image2_blueavg   = cat(3,image2_red,image2_green,(image2_green+image2_red)/2);


[image1_blueresubst, image2_blueest] = ii_estimateblue(image1, image2);

figure(1)
subplot_tight(2,2,1,[0.05,0.01])
imshow(image1)
title Original
subplot_tight(2,2,2,[0.05,0.01])
imshow(image1_blueresubst)
title 'Regression: Blue channel resubstituted'
subplot_tight(2,2,3,[0.05,0.01])
imshow(image1_blueconst)
title 'Constant blue channel'
subplot_tight(2,2,4,[0.05,0.01])
imshow(image1_blueavg)
title 'Blue = average(red,green)'
truesize

figure(2)
subplot_tight(2,2,1,[0.05,0.01])
imshow(image2)
title Original
subplot_tight(2,2,2,[0.05,0.01])
imshow(image2_blueest)
title 'Regression: Blue channel estimated'
subplot_tight(2,2,3,[0.05,0.01])
imshow(image2_blueconst)
title 'Constant blue channel'
subplot_tight(2,2,4,[0.05,0.01])
imshow(image2_blueavg)
title 'Blue = average(red,green)'
truesize

