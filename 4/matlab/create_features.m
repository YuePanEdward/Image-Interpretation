function [ X ] = create_features( varargin )
sy = size(varargin{1}, 1);
sx = size(varargin{1}, 2);
X = cat(3, varargin{:});
nc = size(X,3);
X = reshape(X, [sy*sx nc]);
end

