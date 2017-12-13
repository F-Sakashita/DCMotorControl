/*
 * DOB.h
 *
 *  Created on: 2017/12/12
 *      Author: fumihiko
 */

#ifndef DOB_H_
#define DOB_H_
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


#define OMEGA_DOB	500	//外乱オブザーバの2次遅れ系ローパスフィルタ固有角振動数
#define TSUETA_DOB	1	//外乱オブザーバの2次遅れ系ローパスフィルタ減衰比
#define TF_DOB		0.002f
#define CUTOFF_FREQ_DOB	500
float DOB(float CurrentRef,float VelocityRes);

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* DOB_H_ */
