//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_stereoWidthPlugin_mex.cpp
//
// Code generation for function 'onParamChangeCImpl'
//

// Include files
#include "_coder_stereoWidthPlugin_mex.h"
#include "_coder_stereoWidthPlugin_api.h"

// Function Definitions
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  static const char_T *emlrtEntryPoints[5]{
      "onParamChangeCImpl", "resetCImpl", "processEntryPoint",
      "createPluginInstance", "getLatencyInSamplesCImpl"};
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  mexAtExit(&stereoWidthPlugin_atexit);
  // Module initialization.
  stereoWidthPlugin_initialize();
  st.tls = emlrtRootTLSGlobal;
  // Dispatch the entry-point.
  switch (emlrtGetEntryPointIndexR2016a(
      &st, nrhs, &prhs[0], (const char_T **)&emlrtEntryPoints[0], 5)) {
  case 0:
    unsafe_onParamChangeCImpl_mexFunction(nlhs, nrhs - 1, &prhs[1]);
    break;
  case 1:
    unsafe_resetCImpl_mexFunction(nlhs, nrhs - 1, &prhs[1]);
    break;
  case 2:
    unsafe_processEntryPoint_mexFunction(nlhs, plhs, nrhs - 1, &prhs[1]);
    break;
  case 3:
    unsafe_createPluginInstance_mexFunction(nlhs, nrhs - 1, &prhs[1]);
    break;
  case 4:
    unsafe_getLatencyInSamplesCImpl_mexFunction(nlhs, plhs, nrhs - 1);
    break;
  }
  // Module termination.
  stereoWidthPlugin_terminate();
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, nullptr, 1,
                           nullptr, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

void unsafe_createPluginInstance_mexFunction(int32_T nlhs, int32_T nrhs,
                                             const mxArray *prhs[1])
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  st.tls = emlrtRootTLSGlobal;
  // Check for proper number of arguments.
  if (nrhs != 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 1, 4,
                        20, "createPluginInstance");
  }
  if (nlhs > 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 20,
                        "createPluginInstance");
  }
  // Call the function.
  createPluginInstance_api(prhs[0]);
}

void unsafe_getLatencyInSamplesCImpl_mexFunction(int32_T nlhs, mxArray *plhs[1],
                                                 int32_T nrhs)
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  const mxArray *outputs;
  st.tls = emlrtRootTLSGlobal;
  // Check for proper number of arguments.
  if (nrhs != 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 0, 4,
                        24, "getLatencyInSamplesCImpl");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 24,
                        "getLatencyInSamplesCImpl");
  }
  // Call the function.
  getLatencyInSamplesCImpl_api(&outputs);
  // Copy over outputs to the caller.
  emlrtReturnArrays(1, &plhs[0], &outputs);
}

void unsafe_onParamChangeCImpl_mexFunction(int32_T nlhs, int32_T nrhs,
                                           const mxArray *prhs[2])
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  st.tls = emlrtRootTLSGlobal;
  // Check for proper number of arguments.
  if (nrhs != 2) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 2, 4,
                        18, "onParamChangeCImpl");
  }
  if (nlhs > 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 18,
                        "onParamChangeCImpl");
  }
  // Call the function.
  onParamChangeCImpl_api(prhs);
}

void unsafe_processEntryPoint_mexFunction(int32_T nlhs, mxArray *plhs[2],
                                          int32_T nrhs, const mxArray *prhs[3])
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  const mxArray *outputs[2];
  int32_T i;
  st.tls = emlrtRootTLSGlobal;
  // Check for proper number of arguments.
  if (nrhs != 3) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 3, 4,
                        17, "processEntryPoint");
  }
  if (nlhs > 2) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 17,
                        "processEntryPoint");
  }
  // Call the function.
  processEntryPoint_api(prhs, nlhs, outputs);
  // Copy over outputs to the caller.
  if (nlhs < 1) {
    i = 1;
  } else {
    i = nlhs;
  }
  emlrtReturnArrays(i, &plhs[0], &outputs[0]);
}

void unsafe_resetCImpl_mexFunction(int32_T nlhs, int32_T nrhs,
                                   const mxArray *prhs[1])
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  st.tls = emlrtRootTLSGlobal;
  // Check for proper number of arguments.
  if (nrhs != 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 1, 4,
                        10, "resetCImpl");
  }
  if (nlhs > 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 10,
                        "resetCImpl");
  }
  // Call the function.
  resetCImpl_api(prhs[0]);
}

// End of code generation (_coder_stereoWidthPlugin_mex.cpp)
