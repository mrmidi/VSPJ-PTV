//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_stereoWidthPlugin_api.h
//
// Code generation for function 'onParamChangeCImpl'
//

#ifndef _CODER_STEREOWIDTHPLUGIN_API_H
#define _CODER_STEREOWIDTHPLUGIN_API_H

// Include files
#include "emlrt.h"
#include "tmwtypes.h"
#include <algorithm>
#include <cstring>

// Variable Declarations
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

// Function Declarations
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

void stereoWidthPlugin_atexit();

void stereoWidthPlugin_initialize();

void stereoWidthPlugin_terminate();

void stereoWidthPlugin_xil_shutdown();

void stereoWidthPlugin_xil_terminate();

#endif
// End of code generation (_coder_stereoWidthPlugin_api.h)
