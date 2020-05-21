% first figure
xs = linspace(-3*pi, 3*pi);
ys = mod(xs-pi, 2*pi) - pi;

figure;
plot(xs, ys);

grid on;
xlim([-10, 10]);
ylim([-5, 5]);
xlabel("\theta");
ylabel("f(\theta) = \theta");

print -dpng ../img/q114a.png

% second figure
xs = linspace(-3*pi, 3*pi);
ys = (mod(xs-pi, 2*pi) - pi).^2;

figure;
plot(xs, ys);

grid on;
xlim([-10, 10]);
ylim([0, 10]);
xlabel("\theta");
ylabel("f(\theta) = \theta^2");

print -dpng ../img/q114b.png