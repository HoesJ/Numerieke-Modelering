function C = kkb(x, y, F, m, n)
%kkb Calculates C the coefficients of the least square aproximation of F

% Calculate: B+F(A+)T = (A(x)B)+vec(F)
A = [];
for i=0:m
    A = [A, transpose(x.^i)];
end

B = [];
for j=0:n
    B = [B, transpose(y.^j)];
end

C = reshape(kron(A,B)\F(:),n+1,m+1);
end

