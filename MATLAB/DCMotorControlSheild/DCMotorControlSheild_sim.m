%DC���[�^����V�[���hV1.0�̃V�~�����[�V����
%%
clear;clc;close all;

%�T���v�����O����
dt_minor = 0.000050; %�d���t�B�[�h�o�b�N���[�v
dt_major = 0.000200; %���䃋�[�v

%���[�^�p�����[�^
Jm = 0.0000005; %�v�[���������[�����g[kg*m^2] �T���v�����ƒP�ʂ���������.�l�͎����I�ɋ��߂��̂��낤��
%Jm = 3.185e-8;  %���ƃm�M�X�Ōv���������ʁD���΁{�v�[�����~�Ղƌ��Ȃ��āC1/2*m*r^2�Ōv�Z m=0.0013[kg],r=0.007[m]
Rm = 0.6818;    %���[�^�̓�����R[��]  �T���v�������[�^�̓����}���
Lm = 0.000340;  %���[�^�̃C���_�N�^���X[H] �T���v�����D�ǂ�����ċ��߂����͕s���D
Ktm = 0.001159; %���[�^�̃g���N�萔[Nm/A] �T���v�������[�^�̓����}���
Kem = 0.001574; %���[�^�̋t�N�d�͒萔[V/(ras/s)]�D���[�^�̓����}���

%����p�����[�^
Kfv = 1.0;      %���x����̋ߎ������ł̃Q�C��
Tfv = 0.001;    %���x����̋ߎ������ł̃J�b�g�I�t����
tf_vel_s = tf([Kfv,0],[Tfv,1]) %�A���ߎ�����
tf_vel_d = c2d(tf_vel_s,dt_major,'tustin')  %�o�ꎟ�ϊ��ɂ�闣�U�ߎ�����

Kp_p= 4000.0;    %< Proportional gain of position control [s^2]
Ki_p= 6000.0;    %< Integral     gain of position control [s^3]
Kd_p= 140.0+100;     %< Differential gain of position control [s]

Kp_c = 0.5;
Ki_c = 10.0;

Vm = 4.6;