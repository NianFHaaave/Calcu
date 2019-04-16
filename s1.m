syms c
y=1./(x.^3-2*x-c);
t=integral(y,x);
simplify(t)