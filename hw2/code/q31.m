clear all;

% global theta values, N values, and plot limits
ts = linspace(-3*pi, 3*pi, 1000);
Ns = [2, 5, 20, 75, 150];

% sawtooth
ys = zeros(length(Ns), length(ts));

% get data
i = 1;
prev_N = 0;

for N=Ns
    % add previous sum to current sum
    if i > 1
        ys(i, :) = ys(i - 1, :);
    end

    % compute the remaining terms for this sum
    for n=prev_N+1:N
        delta = 2*(-1)^(n + 1)/n * sin(n*ts);
        ys(i, :) = ys(i, :) + delta;
    end

    % increment loop stuff
    i = i + 1;
    prev_N = N;
end

% plot data
figure;

i = 1;

for n = Ns
    subplot(length(Ns), 1, i);

    hold on;
    plot(ts, ys(i, :));
    plot(ts, ones(1, length(ts)) * pi, '--');
    hold off;

    xlabel("\theta");
    ylabel("y");
    legend([sprintf("S_{%d} f", n), "y = \pi"]);

    i = i + 1;
end

print -dpng ../img/q31a.png -r300

% square
ys = zeros(length(Ns), length(ts));

% get data
i = 1;
prev_N = 0;

for N=Ns
    % add previous sum to current sum
    if i > 1
        ys(i, :) = ys(i - 1, :);
    end

    % compute the remaining terms for this sum
    for n=prev_N+1:N
        delta = 2*(1 - (-1)^n)/(pi*n) * sin(n*ts);
        ys(i, :) = ys(i, :) + delta;
    end

    % increment loop stuff
    i = i + 1;
    prev_N = N;
end

% plot data
figure;

i = 1;

for n = Ns
    subplot(length(Ns), 1, i);

    hold on;
    plot(ts, ys(i, :));
    plot(ts, ones(1, length(ts)), '--');
    hold off;

    xlabel("\theta");
    ylabel("y");
    legend([sprintf("S_{%d} g", n), "y = 1"]);

    i = i + 1;
end

print -dpng ../img/q31b.png -r300
