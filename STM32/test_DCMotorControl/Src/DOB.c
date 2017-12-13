/*
 * DOB.c
 *
 *  Created on: 2017/12/12
 *      Author: fumihiko
 */

#include "DOB.h"
#include "control.h"

float A = 0,B=0,C=0,D=0,E=0;
float CurrentCmd=0;
float DOB(float CurrentRef,float VelocityRes)
{
	static int first=0;
	//1次のフィルター
	if(first == 1){
		B = (VelocityRes + TF_DOB/dt_major *B)/(1 + TF_DOB/dt_major);
		A = (Mn / TF_DOB)  * (VelocityRes - B);
		C = (CurrentCmd * Ktn + (TF_DOB/dt_major) * C)/(1 + TF_DOB/dt_major);
		CurrentCmd = CurrentRef - (A - C)/Ktn;
		/*A = CUTOFF_FREQ_DOB * Mn * VelocityRes;
		B = CurrentCmd * Ktn;
		C = A+B;
		D = (CUTOFF_FREQ_DOB*C + D/dt_major) / (1/dt_major + CUTOFF_FREQ_DOB);
		E = D-A;
		CurrentCmd = CurrentRef + E/Ktn;*/
	}else{
		first = 1;
		CurrentCmd = CurrentRef;
	}
	return CurrentCmd;
}
