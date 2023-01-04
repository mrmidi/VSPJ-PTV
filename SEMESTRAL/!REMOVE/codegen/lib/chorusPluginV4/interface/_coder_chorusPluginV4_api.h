//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_chorusPluginV4_api.h
//
// Code generation for function 'onParamChangeCImpl'
//

#ifndef _CODER_CHORUSPLUGINV4_API_H
#define _CODER_CHORUSPLUGINV4_API_H

// Include files
#include "emlrt.h"
#include "tmwtypes.h"
#include <algorithm>
#include <cstring>

// Variable Declarations
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

// Function Declarations
void chorusPluginV4_atexit();

void chorusPluginV4_initialize();

void chorusPluginV4_terminate();

void chorusPluginV4_xil_shutdown();

void chorusPluginV4_xil_terminate();

void createPluginInstance(uint64_T thisPtr);

void createPluginInstance_api(const mxArray *prhs);

int32_T getLatencyInSamplesCImpl();

void getLatencyInSamplesCImpl_api(const mxArray **plhs);

void onParamChangeCImpl(int32_T paramIdx, real_T value);

void onParamChangeCImpl_api(const mxArray *const prhs[2]);

void processEntryPoint(real_T samplesPerFrame, real_T i1_data[],
                       int32_T i1_size[1], real_T i2_data[], int32_T i2_size[1],
                       real_T o1_data[], int32_T o1_size[1], real_T o2_data[],
                       int32_T o2_size[1]);

void processEntryPoint_api(const mxArray *const prhs[3], int32_T nlhs,
                           const mxArray *plhs[2]);

void resetCImpl(real_T rate);

void resetCImpl_api(const mxArray *prhs);

#endif
// End of code generation (_coder_chorusPluginV4_api.h)