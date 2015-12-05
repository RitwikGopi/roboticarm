using PyPlot
include("check.jl")
include("imageread.jl")

print("---------INITIALIZING----------\n");

A = 10;
B = 10;
global X,Y;
X = [-16:.1:-4];
Y = [-6:.1:8];
n = length(X);
n1 = length(Y);


global p;
p = 0;
global O2;
global C2;

global K;
global S;
S = (zeros(n1,n));
K = 1;

global O1;
O1 = (zeros(n1,n));
global C1;
C1 = (zeros(n1,n));

O = (zeros(n1,n));
B1 = (zeros(n1,n));
C = (zeros(n1,n));

print("CALCULATING DRAWING AREA\n");

for i = 1 : n
for j = 1 : n1
        if X[i] < 0
            O[n1+1-j,i] = pi + atan((Y[j] / X[i]));
        else
            O[n1+1-j,i] = atan((Y[j] / X[i]));
        end
        
        C[n1+1-j,i]  = ( (X[i]^2 + Y[j]^2) ^.5);
        C1[n1+1-j,i] = acos((B^2 + A^2- C[n1+1-j,i]^2) / (2 * B * A));
        B1[n1+1-j,i] = acos((C[n1+1-j,i]^2 + A^2 - B^2) / (2 * C[n1+1-j,i] * A));
        O1[n1+1-j,i] = O[n1+1-j,i] - B1[n1+1-j,i];
end
end
O2 = [O1[1,1]]
C2 = [C1[1,1]]
print("LOADING IMAGE\n")
global img;
img = imageread("logo.jpg");
#imshow(img);
K = 1;
for i = 1:n1
    for j = 1:n
    	if p!=0
	println(p)
    	end
	p = 0;
        check(i,j,1);
    end
end

print("CHECK FINISHED\n");

x = zeros(1,K-1)
y = zeros(1,K-1)

pwm = 650+(O2*1700/pi);
intpwm = int16(pwm);
pwm_ = float64(intpwm);
pwm2 = 650+(C2*1700/pi);
intpwm2 = int16(pwm2);
pwm2_ = float64(intpwm2);

for i = 1:K-1
    C22 = (pwm2_[i]-650) * pi/1700;
    O22 = (pwm_[i]-650)  * pi/1700;
    C0  = (A^2 + B^2 - 2 * A * B * cos(C22))^.5;
    B2  = acos((C0^2 + A^2 - B^2) / (2 * C0 * A));
    O4  =O22 + B2;  
    x[i]=C0 * cos(O4);
    y[i]=C0 * sin(O4);
end

axis([-16,-4,-6,8]);
for t = 1:K-1
plot(x[t],y[t],"r.");
wait(Timer(.001))
end

include("send.jl")
#sendpwm(intpwm,intpwm2)
