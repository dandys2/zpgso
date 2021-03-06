function im = IdealLowPass(I,D)
% D is the circular cutoff frequency which is normalized to  % [0 1]
% imo = imread(I);
I = im2double(I);
[row, col] = size(I);
hr = (row-1)/2;
hc = (col-1)/2;
[x, y] = meshgrid(-hc:hc, -hr:hr);
mg = sqrt((x/hc).^2 + (y/hr).^2);  % normalized distance from origin(a.k.a magnitude)
% mg = sqrt(x.^2 + y.^2);
lp = double(mg <= D);
IM = fftshift(fft2(I)); % img to freq. domain
IP = zeros(size(IM));
IP(:,:) = IM(:,:) .* lp;  % filter -> pass only pixels with distance from origin < D
im = abs(ifft2(ifftshift(IP))); % img back to image domain
end