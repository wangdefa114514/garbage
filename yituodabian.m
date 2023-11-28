%%
fun1={@buttord,@cheb1ord,@cheb2ord};
fun2={@butter,@cheby1,@cheby2};
Wp=2;
Ws=4;
Rp=1;
Rs=30;
for i=1:length(fun1)

   
    [N,Wc]=fun1{i}(Wp,Ws,Rp,Rs,"s");
    if i==1
    [B,A]=fun2{i}(N,Wc,'s');
    else
        [B,A]=fun2{i}(N,Rp,Wc,'s');
    end
    W=linspace(0,8,1000);
    [H,W]=freqs(B,A,W);
    figure(i)
    plot(W,20*log(abs(H)));
    title(i)
end
%% 
fun1={@buttord};
fun2={@butter};
Ws=(1e3)*2*pi;
Wp=(5e3)*2*pi;
Rp=1;
Rs=30;
for i=1:length(fun1)

   
    [N,Wc]=fun1{i}(Wp,Ws,Rp,Rs,"s");
    if i==1
    [B,A]=fun2{i}(N,Wc,'high','s');
    else
        [B,A]=fun2{i}(N,Rp,Wc,'s');
    end
    W=linspace(1,8000,10000);
    [H,W]=freqs(B,A,W);
    figure(i)
    plot(W,20*log(abs(H)));
    title(i)
end
%% 
fun1={@buttord};
fun2={@butter};
Ws=[4,11];
Wp=[6,8];
Rp=1;
Rs=32;
for i=1:length(fun1)

   
    [N,Wc]=fun1{i}(Wp,Ws,Rp,Rs,"s");
    if i==1
    [B,A]=fun2{i}(N,Wc,'s');
    else
        [B,A]=fun2{i}(N,Rp,Wc,'s');
    end
    W=linspace(0,30,1000);
    [H,W]=freqs(B,A,W);
    figure(i)
    plot(W,20*log(abs(H)));
    title(i)
end
%% 
fun1={@buttord};
fun2={@butter};
Wp=2;
Ws=4;
Rp=1;
Rs=30;
fs=[1,2];
fun={@impinvar,@bilinear};
for i=1:length(fun1)
for j=1:length(fs)
    for k=1:length(fun)
   
    [N,Wc]=fun1{i}(Wp,Ws,Rp,Rs,"s");
    if i==1
    [B,A]=fun2{i}(N,Wc,'s');
    else
        [B,A]=fun2{i}(N,Rp,Wc,'s');
    end
    [Bz,Az]=fun{k}(B,A,fs(j));
    W=linspace(0,pi,1000);
    [H,W]=freqz(Bz,Az,W);
    figure((j-1)*2+k)
    plot(W,20*log(abs(H)));
    title((j-1)*2+k);
    sys=tf(Bz,Az,1);
    ltiview(sys);
    end
end
end
bilinear()
