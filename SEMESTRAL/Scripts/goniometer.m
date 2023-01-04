function goniometer(input, fig)

    figure(fig);

    N = length(input);
    x = size(N, 1);
    y = size(N, 2);

    for i = 1:N
        L = input(i, 1);
        R = input(i, 2);

        radius = sqrt(L^2 + R^2);
        angle = atan2(L, R);
        angle = angle + pi/4;

        x(i, 1) = radius * cos(angle);
        y(i, 1) = radius * sin(angle);
    end


    line([-1, 1], [-1, 1], 'Color', [0.75 0.75 0.75]);
    line([-1, 1], [1, -1], 'Color', [0.75 0.75 0.75]);
    line([0, 0], [-1, 1], 'Color', [0.75 0.75 0.75]);
    line([-1, 1], [0, 0], 'Color', [0.75 0.75 0.75]);
    hold on;

    th = 0:pi/50:2*pi;
    xunit = cos(th);
    yunit = sin(th);
    plot (xunit, yunit, 'Color', [0.75 0.75 0.75]);

    % Left
    xL = -0.75;
    yL = 0.8;
    txtL = 'L';
    text(xL, yL, txtL, 'Color', [0.75 0.75 0.75]);

    % Right
    xR = 0.73;
    yR = 0.8;
    txtR = 'R';
    text(xR, yR, txtR, 'Color', [0.75 0.75 0.75]);

    % Mid
    xM = -0.018;
    yM = 0.96;
    txtM = 'M';
    text(xM, yM, txtM, 'Color', [0.75 0.75 0.75]);

    % Side 
    xS = -0.98;
    yS = 0;
    txtS = 'S';
    text(xS, yS, txtS, 'Color', [0.75 0.75 0.75]);

    % Plot data
    plot(x, y, '.b');
    axis([-1 1 -1 1]);
    hold off;

end