function y = periospline(x,f,t)
%PERIOSPLINE returns the values of a periodic spline approximation of the
%functions f in the points t

% add last point
f = [f f(:,1)];

% Create left-hand side matrix
deltaX = diff(x)';
M = diag(deltaX(1:end-1),1)+2*diag(circshift(deltaX,1)+deltaX)+diag(deltaX(1:end-1),-1);
M(1,length(deltaX)) = deltaX(end);
M(length(deltaX),1) = deltaX(end);

% Create right-hand side matrix
deltaF = diff(f');
df_dx = deltaF./repmat(deltaX, 1, size(deltaF,2));
b = df_dx - circshift(df_dx,1);

% Get S values
S = M\b;
S = [S;S(1,:)];


y = zeros(size(f,1),length(t));
for k = 1:length(t)
    i = find(x(1:end-1) <= t(k), 1, 'last')+1;
    A = (f(:,i)*(t(k)-x(i-1)) + f(:,i-1)*(x(i)-t(k))) / deltaX(i-1);
    B = ((t(k)-x(i-1))^3 / deltaX(i-1) - deltaX(i-1)*(t(k)-x(i-1)))/6;
    C = -((t(k)-x(i))^3 / deltaX(i-1) + deltaX(i-1)*(x(i)-t(k)))/6;
    y(:,k) = A + B * S(i,:)' + C * S(i-1,:)';
end
end

