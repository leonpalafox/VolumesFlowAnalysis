%y = 1.2868x2 - 2.311x + 148.19
%y is in cm
%x is in m
%rescaled
%y = 1.2868(100)(100)x2 - 2.311(100)x + 148.19
%vol = pi*int(f(x)^2)dx a->b

fun = @(x)  x.*abs((1.2868*x.^2 - 2.311*x + 148.19)./100);
q = 2*pi*integral(fun,0,8);

%% Second Function
%y = 531.17e-0.102x
offset = 355.9646;
disp 'SecondEquation'
syms x_val y_val
y_ar = 1:-0.01:0.01;
clear q
q(1)=1;
for y_ind = y_ar
    S = solve(531.17*exp(-0.102*x_val)==y_ind,x_val);
    up_lim = double(S);
    fun2 = @(x) x.*abs(531.17*exp(-0.102*x)./100);
    q(end+1) = 2*pi*integral(fun2,8,up_lim); 
end
%half value
q(1)=[]; %clean q
plot(q, y_ar)
ylabel('Y values [cm]')
xlabel('Volume [m^3]')
%% Third Function
%y = 19.126e-0.025x
disp 'Third Equation'
syms x_val
y_ar = 1:-0.01:0.01;
clear q
q(1) = 1;
for y_ind = y_ar
    S = solve(19.126*exp(-0.025*x_val)==y_ind,x_val);
    up_lim = double(S);
    fun3 = @(x) x.*abs(19.126*exp(-0.025*x)./100);
    q(end+1) = 2*pi*integral(fun3,0,up_lim); 
end
y_ind = 19.126/2;
S_2 = solve(19.126*exp(-0.025*x_val)==y_ind,x_val);
double(S_2)
q(1)=[]; %clean q
plot(q, y_ar)
ylabel('Y values [cm]')
xlabel('Volume [cm^3]')