%% Periodic spline test
% [X,Y] = click();
resolution = 600;

t1 = linspace(0,1,length(X)+1);
eval1 = linspace(0,1,resolution);

t2 = cumsum([sqrt(diff(X).^2+diff(Y).^2),norm([X(end)-X(1),Y(end)-Y(1)])]);
t2 = [0 t2];
eval2 = linspace(0,max(t2),resolution);

% plot(X,Y)
hold on
approx1 = periospline(t1, [X;Y], eval1);
% plot(approx1(1,:), approx1(2,:));
approx2 = periospline(t2, [X;Y], eval2);
plot(approx2(1,:), approx2(2,:));
hold off

%% Checking sine
resolution=1000;
maxN = 40;
res = ones(1,maxN-2);
for p = 7:9:maxN
x = linspace(0, 2*pi, p);
f = sin(x) + sin(4*x)/2;
eval = linspace(0,2*pi,resolution);

approx = periospline(x,f(1:end-1),eval);
exact = sin(eval) + sin(4*eval)/2;
subplot(2,2,ceil(p/9));
plot(eval, approx-exact);
title(sprintf('Fout van de spline met %i abcissen',p));
res(p-1) = max(abs(approx -  exact));
end

% semilogy(2:maxN, res);
% plot(eval, approx);
% hold on
% plot(eval,exact);


