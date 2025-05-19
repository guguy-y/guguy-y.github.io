num1=[2 -1];
den1=[1 -2 1];
fs=8e9;
ts=1;

Hz1=tf(num1,den1,ts);%生成没有补偿，没有延迟的理想2阶的传递函数
H1z=d2d(Hz1,ts/2);%以0.5周期重新采样
z=zpk('z',ts/2);%在0.5采样时间出设立一个函数z
H2z=z*H1z;
kd=H2z.k;%求得ELD补偿环路反馈系数
H3z=H2z-kd;%忽略ELD补偿系数的传递函数
Hs=d2c(H3z);%对剩下部分进行转换d2c

num2=1;
den2=[1 -1];
Hz2=tf(num2,den2,ts);
H1z2=d2d(Hz2,ts/2);
z=zpk('z',ts/2);%在0.5采样时间出设立一个函数z
H2z2=z*H1z2;
kd2=H2z2.k;%求得ELD补偿环路反馈系数
H3z2=H2z2-kd2;%忽略ELD补偿系数的传递函数
Hs2=d2c(H3z2);%对剩下部分进行转换d2c

