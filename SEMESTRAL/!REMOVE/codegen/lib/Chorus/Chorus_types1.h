//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// Chorus_types1.h
//
// Code generation for function 'Chorus_types1'
//

#ifndef CHORUS_TYPES1_H
#define CHORUS_TYPES1_H

// Include files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

// Type Definitions
struct dsp_VariableFractionalDelay_0 {
  int S0_isInitialized;
  int W0_BUFF_OFFSET;
  double W1_BUFF[130002];
  int W2_PrevNumTaps;
  int W3_PrevNumChan;
  double P0_IC;
};

#endif
// End of code generation (Chorus_types1.h)
