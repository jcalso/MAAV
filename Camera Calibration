
% Camera calibration IARC 2017

% Data: f = front l = left r = right b = back bot = bottom
% w = world / in IMU coordinates
% 12 correspondences per image, from two checker boards.
% All img measurements in pixel, all imu measurements in mm.
pts = tdfread('../data/coords_may3.csv', ',');

n = 20;
pimg = [pts.imgx, pts.imgy]; % coordinates in image frame
pimu = [pts.imux, pts.imuy, pts.imuz, ones(size(pts.imuz))]; % coords in imu frame

A = [];
for i = 1:n
    corr = [pimu(i, :), zeros(1, 4), -pimg(i, 1) * pimu(i, :);
            zeros(1, 4), pimu(i, :), -pimg(i, 2) * pimu(i, :)];
    A = [A; corr]; % I know, I know ... 
end

[U, S, V] = svd(A);

m = V(end, :);
M = [m(1), m(2), m(3), m(4); 
     m(5), m(6), m(7), m(8); 
     m(9), m(10), m(11), m(12)];
 
a1 = M(1,1:3);
a2 = M(2,1:3);
a3 = M(3,1:3);
b = M(:,4);

rho = -1 / norm(a3);
r3 = rho * a3;
x0 = rho * rho * dot(a1, a3);
y0 = rho * rho * dot(a2, a3);

theta = acos(-dot(cross(a1, a3),cross(a2, a3)) / ...
             (norm(cross(a1, a3)) * norm(cross(a2, a3))));
alpha = rho * rho * norm(cross(a1, a3)) * sin(theta);
beta = rho * rho * norm(cross(a2, a3)) * sin(theta);


r1 = rho*rho*sin(theta)/beta*cross(a2, a3);
r2 = cross(r3, r1);

K = [alpha, -alpha*cot(theta), x0;...
     0,     beta/sin(theta),   y0; ...
     0,     0,                 1];
Rt = [[r1; r2; r3], rho * (K\b)];


projected = K * Rt * pimu';
projected = projected ./ projected(3,:);

figure;
scatter(projected(1,:), projected(2,:));
hold on;
scatter(pimg(:,1), pimg(:,2));



