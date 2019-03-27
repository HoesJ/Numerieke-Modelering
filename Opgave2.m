%% Periodic spline test
[X,Y] = click();
t = linspace(0,1,length(X)+1);

approx = periospline(t, [X;Y], linspace(0,1,100));
plot(approx(1,:), approx(2,:));