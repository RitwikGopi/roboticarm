using PyPlot

function drawing_area(A,B)
O2=[0.0628318530717959:pi/1366/2:pi];
O1=[0.0628318530717959:pi/1366/2:pi];

k=1;
n = length(O1);
n1 = length(O2);

R = zeros(n);
O3 = zeros(n);
O = zeros(n*n1);
X = zeros(n*n1);
Y = zeros(n*n1);

for i=1:n
R[i]=(A^2+B^2-2*A*B*cos(O1[i]))^.5;
O3[i]=asin(B*sin(O1[i])/R[i]);

    for j=1:n1
    O[k]=O2[j]+O3[i];
    X[k]=R[i]*cos(O[k])
    Y[k]=R[i]*sin(O[k])
    k=k+1;
    end
end

plot(X,Y, "b.")
end

