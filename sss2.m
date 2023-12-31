clc;
x=ones(1,4);
t=128;
Y=fft(x,t);
p1=abs(Y);
p2=angle(Y);
nx=0:t-1;
figure(1);
stem(nx,p1);
figure(2);
stem(nx,p2);
%% 
t=16;
x=ones(1,4);
y=ones(1,5);
nx=0:(t-1);
out=fft(x,t).*fft(y,t);
out=ifft(out);
figure(1);
stem(nx,out);
figure(2);
stem(0:7,conv(x,y));
%% 
fft_length=512;
f_s=64;
T=1;
t=0:(1/f_s):1;
x=5*cos(20*pi*t+pi/6);
X=fft(x,fft_length);
figure(1);
plot(0:(fft_length-1),abs(X));
figure(2);
stem(t,x);


