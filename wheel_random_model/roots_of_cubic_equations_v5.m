%%
clear
%clc



N = 500
E = 2512

%k = 3.2
#E = ceil(k*N)/2

%E = (N + ((N+2)*sqrt(3*(N+2)))/9)




eps2 = 0.0%0.00002;
g = (1-(eps2/3));
u = (eps2*eps2*eps2 + 9*eps2*eps2 + 36*eps2)/27;
v = (eps2*eps2+6*eps2+6)/9; 

if E< (N*g+u-1)+ceil(((N+3*v)*sqrt(3*(N+3*v)))/9)
 fprintf('Correct!!!\n')
end


sigma = 1.0 - eps2;
%a = 1
p = -2*sigma - 4;
q = 8*sigma + sigma^2 + 1 - N;
r = 2*E - 4*sigma^2;

%fprintf('p= %0.4f q= %0.4f r= %0.4f\n',p,q,r);

a = (1/3) * (3*q - p*p);
b = (1/27) * (2*p*p*p - 9*p*q + 27*r);

%fprintf('a= %0.4f b= %0.4f\n',a,b);

T1 = b*b/4+a*a*a/27;

if T1==0.0 || T1>0.0
   A = nthroot(((-b/2) + sqrt(T1)),3);
   B = nthroot(((-b/2) - sqrt(T1)),3);
else
   A = ((-b/2) + sqrt(T1))^(1/3);
   B = ((-b/2) - sqrt(T1))^(1/3);
end

y1 = A + B;
y2 = -(1/2)*(A+B) - (i*sqrt(3)/2)*(A-B);
y3 = -(1/2)*(A+B) + (i*sqrt(3)/2)*(A-B);

%%y2 = -(1/2)*(A+B) + ((sqrt(-1)*sqrt(3))/2)*(A-B);
%%y3 = -(1/2)*(A+B) - ((sqrt(-1)*sqrt(3))/2)*(A-B);


x1 = y1 - p/3
x2 = y2 - p/3
x3 = y3 - p/3
 
%fprintf('x1: %0.2f x2: %0.2f\n',x1,x2);
fprintf('x1: %0.2f x2: %0.2f x3: %0.2f\n',ceil(x1),ceil(x2),ceil(x3));
%x1=abs(x1)
n1 = ceil((ceil(x1)+eps2-1)^2);
n2 = N-n1-1;
fprintf('n1: %d n2: %d\n',n1,n2);

n1 = ceil((ceil(x2)+eps2-1)^2);
n2 = N-n1-1;
fprintf('n1: %d n2: %d\n',n1,n2);

n1 = ceil((ceil(x3)+eps2-1)^2);
n2 = N-n1-1;
fprintf('n1: %d n2: %d\n',n1,n2);


%n1 = (abs(x2)-1)^2
%n2 = N-n1-1
