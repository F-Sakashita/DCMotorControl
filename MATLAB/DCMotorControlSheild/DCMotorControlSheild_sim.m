%DCモータ制御シールドV1.0のシミュレーション
%%
clear;clc;close all;

%サンプリング周期
dt_minor = 0.000050; %電流フィードバックループ
dt_major = 0.000200; %制御ループ

%モータパラメータ
Jm = 0.0000005; %プーリ慣性モーメント[kg*m^2] サンプルだと単位がおかしい.値は実験的に求めたのだろうか
%Jm = 3.185e-8;  %秤とノギスで計測した結果．磁石＋プーリを円盤と見なして，1/2*m*r^2で計算 m=0.0013[kg],r=0.007[m]
Rm = 0.6818;    %モータの内部抵抗[Ω]  サンプル＆モータの特性図より
Lm = 0.000340;  %モータのインダクタンス[H] サンプルより．どうやって求めたかは不明．
Ktm = 0.001159; %モータのトルク定数[Nm/A] サンプル＆モータの特性図より
Kem = 0.001574; %モータの逆起電力定数[V/(ras/s)]．モータの特性図より

%制御パラメータ
Kfv = 1.0;      %速度推定の近似微分でのゲイン
Tfv = 0.001;    %速度推定の近似微分でのカットオフ周期
tf_vel_s = tf([Kfv,0],[Tfv,1]) %連続近似微分
tf_vel_d = c2d(tf_vel_s,dt_major,'tustin')  %双一次変換による離散近似微分

Kp_p= 4000.0;    %< Proportional gain of position control [s^2]
Ki_p= 6000.0;    %< Integral     gain of position control [s^3]
Kd_p= 140.0+100;     %< Differential gain of position control [s]

Kp_c = 0.5;
Ki_c = 10.0;

Vm = 4.6;