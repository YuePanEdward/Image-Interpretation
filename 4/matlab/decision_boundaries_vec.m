function [ image ] = decision_boundaries_vec( xrange, yrange, steps, classifier )

[x,y] = meshgrid(linspace(xrange(1),xrange(2),steps), ...
                 linspace(yrange(1),yrange(2),steps));
image_size = size(x);

features = [x(:),y(:)];

if isa(classifier, 'function_handle')
    image = classifier(features);
else
    image = predict(classifier, features);
end

image = reshape(image, image_size);
end

