%y = 1.2868x2 - 2.311x + 148.19
%y is in cm
%x is in m
%rescaled
%y = 1.2868(100)(100)x2 - 2.311(100)x + 148.19
%vol = pi*int(f(x)^2)dx a->b
y_flag = 0.1;
fun = @(x)  x.*abs((1.2868*x.^2 - 2.311*x + 148.19)./100);
q = 2*pi*integral(fun,0,8);

%% Second Function
%y = 531.17e-0.102x
offset = 355.9646;
disp 'SecondEquation'
syms x_val y_val
y_ar = y_flag
S = solve(531.17*exp(-0.102*x_val)==y_ar,x_val);
up_lim = double(S);
clear q_ar x_ar
x_ar(1)=1;
q_ar(1)=1;
for x_ind = 0.01:0.01:up_lim
    if x_ind<=8
       fun = @(x)  x.*abs((1.2868*x.^2 - 2.311*x + 148.19)./100);   
       q = 2*pi*integral(fun,0,x_ind); 
       q_off = q;
    elseif x_ind > 8
        fun2 = @(x) x.*abs(531.17*exp(-0.102*x)./100);
        q = 2*pi*integral(fun2,8,x_ind)+ q_off; 
    end
    x_ar(end+1) = x_ind;
    q_ar(end+1) = q;
 
end
%half value
q_ar(1)=[]; %clean q
x_ar(1) = [];
plot(x_ar, q_ar)
xlabel('X values [m]')
ylabel('Volume [m^3]')

%% Third Function
%y = 19.126e-0.025x
disp 'Third Equation'
syms x_val
y_ar = 1:-0.01:0.01;
clear q_ar1 x_ar1
q_ar1(1) = 1;
x_ar1(1) = 1;
y_ind = y_flag;

S = solve(19.126*exp(-0.025*x_val)==y_ind,x_val);
up_lim = double(S);
for x_ind =0.01:0.01:up_lim
    fun3 = @(x) x.*abs(19.126*exp(-0.025*x)./100);
    q = 2*pi*integral(fun3,0,x_ind);
    x_ar1(end+1) = x_ind;
    q_ar1(end+1) = q;
 
end
hold on
q_ar1(1)=[]; %clean q
x_ar1(1)=[];
plot(x_ar1, q_ar1)
legend('Eq 1 + 2','Eq 3','Location','southeast')
text_desc = ['Values of Volume in function of distance for Y value of:', num2str(y_flag), ' cm']
title(text_desc)