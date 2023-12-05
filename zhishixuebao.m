%%

fun={@hanning,@hamming,@blackman};
Wp=pi/2;
Ws=pi/4;
B=Wp-Ws;
N0=[ceil(6.2*pi/B),ceil(6.6*pi/B),ceil(11*pi/B)];

for i=1:length(fun)
N=N0(i)+mod(N0(i)+1,2);
Wc=(Wp+Ws)/2/pi;
h=fir1(N-1,Wc,'high',fun{i}(N));

figure(2*(i-1)+1)
stem([0:N-1],h);
figure(2*i);
freqz(h,[1]);
end
%%
B=pi/15;
N0=ceil(2*pi/B);
N=N0+mod(N0+1,2);
n=[0:N-1];
Hk=zeros([1,N]);
Hk([1:6])=ones([1,6]);
theta=n*pi*(-30/31);
sb=Hk.*(exp(theta*(-j)));
h=ifft(sb);
freqz(h,[1]);

%%
fun={@blackman};
Wpl=0.35*pi;
Wpu=0.65*pi;
Wsl=0.2*pi;
Wsu=0.65*pi;
Wc=[Wpl+Wsl,Wsu+Wpu]/2/pi;

B=Wpl-Wsl;
N0=[ceil(6.2*pi/B)];

for i=1:length(fun)
N=N0(i)+mod(N0(i)+1,2);

h=fir1(N-1,Wc,'bandpass',fun{i}(N));

figure(2*(i-1)+1)
stem([0:N-1],h);
figure(2*i);
freqz(h,[1]);
end
%%
f=[0.2,0.35,0.65,0.8];
m=[1,0,1];
Rp=1;
Rs=60;
dat1=(10^(Rp/20)-1)/(10^(Rp/20)+1);
dat2=10^(-Rs/20);
rip=[dat1,dat2,dat1];
[M,f0,m0,w]=remezord(f,m,rip);
hn=remez(M,f0,m0,w);
freqz(hn,[1]);
