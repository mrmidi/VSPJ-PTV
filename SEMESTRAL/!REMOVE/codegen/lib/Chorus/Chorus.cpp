//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// Chorus.cpp
//
// Code generation for function 'Chorus'
//

// Include files
#include "Chorus.h"
#include "Chorus_types.h"
#include "Chorus_types1.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cfloat>
#include <cmath>
#include <cstring>

// Function Declarations
static void binary_expand_op(coder::array<double, 2U> &in1, double in2,
                             const coder::array<double, 2U> &in3,
                             const coder::array<double, 2U> &in4);

namespace coder {
static void sum(const ::coder::array<double, 3U> &x,
                ::coder::array<double, 2U> &y);

}
static derivedAudioPlugin *getPluginInstance(ChorusStackData *SD);

static void getPluginInstance_free(ChorusStackData *SD);

static void getPluginInstance_init(ChorusStackData *SD);

static double rt_remd_snf(double u0, double u1);

// Function Definitions
namespace coder {
void audioOscillator::generateSawtooth(double *ph, double frameLength,
                                       double phaseStep, double width, double A,
                                       double DCOffset,
                                       ::coder::array<double, 1U> &y)
{
  array<double, 2U> b_y;
  array<double, 2U> i2;
  array<double, 1U> i1;
  array<double, 1U> rt;
  array<double, 1U> t;
  array<int, 2U> r;
  array<int, 1U> ii;
  array<boolean_T, 2U> b;
  array<boolean_T, 1U> x;
  double varargin_1;
  int i;
  int idx;
  int nx;
  int nxin;
  boolean_T exitg1;
  if (frameLength - 1.0 < 0.0) {
    i2.set_size(1, 0);
  } else {
    i2.set_size(1, static_cast<int>(frameLength - 1.0) + 1);
    idx = static_cast<int>(frameLength - 1.0);
    for (i = 0; i <= idx; i++) {
      i2[i] = i;
    }
  }
  t.set_size(i2.size(1));
  idx = i2.size(1);
  for (i = 0; i < idx; i++) {
    t[i] = *ph + i2[i] * phaseStep;
  }
  rt.set_size(t.size(0));
  idx = t.size(0);
  for (i = 0; i < idx; i++) {
    varargin_1 = t[i];
    rt[i] = rt_remd_snf(varargin_1, 1.0);
  }
  x.set_size(rt.size(0));
  idx = rt.size(0);
  for (i = 0; i < idx; i++) {
    x[i] = (rt[i] <= width);
  }
  nx = x.size(0);
  idx = 0;
  ii.set_size(x.size(0));
  nxin = 0;
  exitg1 = false;
  while ((!exitg1) && (nxin <= nx - 1)) {
    if (x[nxin]) {
      idx++;
      ii[idx - 1] = nxin + 1;
      if (idx >= nx) {
        exitg1 = true;
      } else {
        nxin++;
      }
    } else {
      nxin++;
    }
  }
  if (x.size(0) == 1) {
    if (idx == 0) {
      ii.set_size(0);
    }
  } else {
    if (idx < 1) {
      idx = 0;
    }
    ii.set_size(idx);
  }
  i1.set_size(ii.size(0));
  idx = ii.size(0);
  for (i = 0; i < idx; i++) {
    i1[i] = ii[i];
  }
  if (t.size(0) < 1) {
    i2.set_size(1, 0);
  } else {
    i2.set_size(1, t.size(0));
    idx = t.size(0) - 1;
    for (i = 0; i <= idx; i++) {
      i2[i] = static_cast<double>(i) + 1.0;
    }
  }
  ii.set_size(i1.size(0));
  idx = i1.size(0);
  for (i = 0; i < idx; i++) {
    ii[i] = static_cast<int>(i1[i]);
  }
  nxin = i2.size(1);
  b.set_size(1, i2.size(1));
  idx = i2.size(1);
  for (i = 0; i < idx; i++) {
    b[i] = false;
  }
  i = ii.size(0);
  for (int k{0}; k < i; k++) {
    b[ii[k] - 1] = true;
  }
  nx = 0;
  i = b.size(1);
  for (int k{0}; k < i; k++) {
    nx += b[k];
  }
  nx = i2.size(1) - nx;
  idx = -1;
  for (int k{0}; k < nxin; k++) {
    if ((k + 1 > b.size(1)) || (!b[k])) {
      idx++;
      i2[idx] = i2[k];
    }
  }
  if (nx < 1) {
    nx = 0;
  }
  i2.set_size(i2.size(0), nx);
  y.set_size(t.size(0));
  idx = t.size(0);
  for (i = 0; i < idx; i++) {
    y[i] = 0.0;
  }
  varargin_1 = 0.5 * width;
  idx = i1.size(0);
  for (i = 0; i < idx; i++) {
    nx = static_cast<int>(i1[i]) - 1;
    y[nx] = (rt[nx] - varargin_1) * 2.0;
  }
  if (width != 0.0) {
    varargin_1 = 1.0 / width;
    t.set_size(i1.size(0));
    idx = i1.size(0);
    for (i = 0; i < idx; i++) {
      t[i] = y[static_cast<int>(i1[i]) - 1] * varargin_1;
    }
    idx = t.size(0);
    for (i = 0; i < idx; i++) {
      y[static_cast<int>(i1[i]) - 1] = t[i];
    }
  }
  r.set_size(1, i2.size(1));
  idx = i2.size(1);
  for (i = 0; i < idx; i++) {
    r[i] = static_cast<int>(i2[i]);
  }
  varargin_1 = 0.5 * (1.0 - width);
  idx = r.size(1);
  for (i = 0; i < idx; i++) {
    y[r[i] - 1] = ((-rt[static_cast<int>(i2[i]) - 1] + 1.0) - varargin_1) * 2.0;
  }
  if (width != 1.0) {
    r.set_size(1, i2.size(1));
    idx = i2.size(1);
    for (i = 0; i < idx; i++) {
      r[i] = static_cast<int>(i2[i]);
    }
    varargin_1 = 1.0 / (1.0 - width);
    b_y.set_size(1, r.size(1));
    idx = r.size(1);
    for (i = 0; i < idx; i++) {
      b_y[i] = y[static_cast<int>(i2[i]) - 1] * varargin_1;
    }
    idx = b_y.size(1);
    for (i = 0; i < idx; i++) {
      y[r[i] - 1] = b_y[i];
    }
  }
  if (width == 0.0) {
    nx = rt.size(0);
    for (idx = 0; idx < nx; idx++) {
      if (rt[idx] == 0.0) {
        y[idx] = 1.0;
      }
    }
  }
  idx = y.size(0);
  for (i = 0; i < idx; i++) {
    y[i] = A * y[i] + DCOffset;
  }
  varargin_1 = *ph + frameLength * phaseStep;
  if (std::isnan(varargin_1) || std::isinf(varargin_1)) {
    *ph = rtNaN;
  } else if (varargin_1 == 0.0) {
    *ph = 0.0;
  } else {
    *ph = std::fmod(varargin_1, 1.0);
    if (*ph == 0.0) {
      *ph = 0.0;
    } else if (varargin_1 < 0.0) {
      (*ph)++;
    }
  }
}

void audioOscillator::generateSine(double *ph, double samplesPerFrame,
                                   double phaseStep, double A, double DCOffset,
                                   ::coder::array<double, 1U> &y)
{
  array<double, 2U> r;
  array<double, 1U> ytemp;
  double x;
  int nx;
  nx = static_cast<int>(samplesPerFrame);
  ytemp.set_size(nx);
  for (int k{0}; k < nx; k++) {
    ytemp[k] = 0.0;
  }
  if (samplesPerFrame - 1.0 < 0.0) {
    r.set_size(1, 0);
  } else {
    r.set_size(1, static_cast<int>(samplesPerFrame - 1.0) + 1);
    nx = static_cast<int>(samplesPerFrame - 1.0);
    for (int k{0}; k <= nx; k++) {
      r[k] = k;
    }
  }
  y.set_size(r.size(1));
  nx = r.size(1);
  for (int k{0}; k < nx; k++) {
    y[k] = 6.2831853071795862 * (*ph + r[k] * phaseStep);
  }
  nx = y.size(0);
  for (int k{0}; k < nx; k++) {
    y[k] = std::sin(y[k]);
  }
  nx = y.size(0);
  for (int k{0}; k < nx; k++) {
    ytemp[k] = A * y[k] + DCOffset;
  }
  x = *ph + samplesPerFrame * phaseStep;
  if (std::isnan(x) || std::isinf(x)) {
    *ph = rtNaN;
  } else if (x == 0.0) {
    *ph = 0.0;
  } else {
    *ph = std::fmod(x, 1.0);
    if (*ph == 0.0) {
      *ph = 0.0;
    } else if (x < 0.0) {
      (*ph)++;
    }
  }
  if (ytemp.size(0) == 0) {
    y.set_size(0);
  } else {
    nx = ytemp.size(0);
    y.set_size(ytemp.size(0));
    for (int k{0}; k < nx; k++) {
      y[k] = ytemp[k];
    }
  }
}

void audioOscillator::generateSquare(double *ph, double frameLength,
                                     double phaseStep, double dutyCycle,
                                     double A, double DCOffset,
                                     ::coder::array<double, 1U> &y)
{
  array<double, 2U> r;
  array<double, 1U> tmp;
  int loop_ub;
  if (frameLength - 1.0 < 0.0) {
    r.set_size(1, 0);
  } else {
    r.set_size(1, static_cast<int>(frameLength - 1.0) + 1);
    loop_ub = static_cast<int>(frameLength - 1.0);
    for (int i{0}; i <= loop_ub; i++) {
      r[i] = i;
    }
  }
  tmp.set_size(r.size(1));
  loop_ub = r.size(1);
  for (int i{0}; i < loop_ub; i++) {
    double varargin_1;
    double varargout_1;
    varargin_1 = *ph + r[i] * phaseStep;
    if (std::isnan(varargin_1) || std::isinf(varargin_1)) {
      varargout_1 = rtNaN;
    } else if (varargin_1 == 0.0) {
      varargout_1 = 0.0;
    } else {
      varargout_1 = std::fmod(varargin_1, 1.0);
      if (varargout_1 == 0.0) {
        varargout_1 = 0.0;
      } else if (varargin_1 < 0.0) {
        varargout_1++;
      }
    }
    tmp[i] = varargout_1;
  }
  y.set_size(tmp.size(0));
  loop_ub = tmp.size(0);
  for (int i{0}; i < loop_ub; i++) {
    y[i] = A * (2.0 * static_cast<double>(tmp[i] < dutyCycle) - 1.0) + DCOffset;
  }
  *ph = tmp[tmp.size(0) - 1] + phaseStep;
}

void audioOscillator::step(::coder::array<double, 1U> &varargout_1)
{
  double d;
  if (isInitialized != 1) {
    isInitialized = 1;
    pPhaseOffsetCast = pPhaseOffset[0];
    pFrequencyCast = pFrequency[0];
    pType = 1.0;
    isSetupComplete = true;
    TunablePropsChanged = false;
    pPhase = pPhaseOffsetCast;
    pAmplitudeCast = pAmplitude[0];
    pDCOffsetCast = pDCOffset[0];
    pDutyCycleCast = pDutyCycle;
    pWidthCast = pWidth;
    pFrequencyCast = pFrequency[0];
    pPhaseStep = pFrequencyCast / SampleRate;
  }
  if (TunablePropsChanged) {
    TunablePropsChanged = false;
    pAmplitudeCast = pAmplitude[0];
    pDCOffsetCast = pDCOffset[0];
    pDutyCycleCast = pDutyCycle;
    pWidthCast = pWidth;
    pFrequencyCast = pFrequency[0];
    pPhaseStep = pFrequencyCast / SampleRate;
  }
  switch (static_cast<int>(pType)) {
  case 1:
    d = pPhase;
    audioOscillator::generateSine(&d, std::fmin(SamplesPerFrame, 192000.0),
                                  pPhaseStep, pAmplitudeCast, pDCOffsetCast,
                                  varargout_1);
    pPhase = d;
    break;
  case 2:
    d = pPhase;
    audioOscillator::generateSquare(&d, std::fmin(SamplesPerFrame, 192000.0),
                                    pPhaseStep, pDutyCycleCast, pAmplitudeCast,
                                    pDCOffset[0], varargout_1);
    pPhase = d;
    break;
  default:
    d = pPhase;
    audioOscillator::generateSawtooth(&d, std::fmin(SamplesPerFrame, 192000.0),
                                      pPhaseStep, pWidthCast, pAmplitudeCast,
                                      pDCOffset[0], varargout_1);
    pPhase = d;
    break;
  }
}

} // namespace coder
void derivedAudioPlugin::process(const coder::array<double, 2U> &x,
                                 coder::array<double, 2U> &out)
{
  coder::audioOscillator *oscillator1;
  coder::dspcodegen::VariableFractionalDelay *obj;
  coder::array<double, 3U> delayVector;
  coder::array<double, 3U> y;
  coder::array<double, 2U> r;
  coder::array<double, 2U> r1;
  coder::array<double, 1U> varargout_1;
  dsp_VariableFractionalDelay_0 *b_obj;
  double fs;
  int i;
  int ibtile;
  int jtilecol;
  int k;
  int nSamps;
  int nrows;
  int ti;
  boolean_T flag;
  boolean_T incrementDelayPerChannel;
  fs = pSR;
  oscillator1 = &pSine1;
  fs *= Delay;
  flag = (pSine1.isInitialized == 1);
  if (flag) {
    pSine1.TunablePropsChanged = true;
  }
  pSine1.SamplesPerFrame = x.size(0);
  flag = (pSine2.isInitialized == 1);
  if (flag) {
    pSine2.TunablePropsChanged = true;
  }
  pSine2.SamplesPerFrame = x.size(0);
  delayVector.set_size(x.size(0), 2, 2);
  nrows = x.size(0) << 2;
  for (i = 0; i < nrows; i++) {
    delayVector[i] = 0.0;
  }
  oscillator1->step(varargout_1);
  nrows = varargout_1.size(0);
  for (i = 0; i < nrows; i++) {
    varargout_1[i] = fs + varargout_1[i];
  }
  r.set_size(varargout_1.size(0), 2);
  nrows = varargout_1.size(0);
  for (jtilecol = 0; jtilecol < 2; jtilecol++) {
    ibtile = jtilecol * nrows;
    for (k = 0; k < nrows; k++) {
      r[ibtile + k] = varargout_1[k];
    }
  }
  nrows = r.size(0);
  for (i = 0; i < 2; i++) {
    for (ibtile = 0; ibtile < nrows; ibtile++) {
      delayVector[ibtile + delayVector.size(0) * i] = r[ibtile + r.size(0) * i];
    }
  }
  pSine2.step(varargout_1);
  nrows = varargout_1.size(0);
  for (i = 0; i < nrows; i++) {
    varargout_1[i] = fs + varargout_1[i];
  }
  r.set_size(varargout_1.size(0), 2);
  nrows = varargout_1.size(0);
  for (jtilecol = 0; jtilecol < 2; jtilecol++) {
    ibtile = jtilecol * nrows;
    for (k = 0; k < nrows; k++) {
      r[ibtile + k] = varargout_1[k];
    }
  }
  nrows = r.size(0);
  for (i = 0; i < 2; i++) {
    for (ibtile = 0; ibtile < nrows; ibtile++) {
      delayVector[(ibtile + delayVector.size(0) * i) +
                  delayVector.size(0) * 2] = r[ibtile + r.size(0) * i];
    }
  }
  obj = &pFractionalDelay;
  if (pFractionalDelay.isInitialized != 1) {
    pFractionalDelay.isSetupComplete = false;
    pFractionalDelay.isInitialized = 1;
    pFractionalDelay.isSetupComplete = true;
    b_obj = &pFractionalDelay.cSFunObject;
    // System object Initialization function: dsp.VariableFractionalDelay
    obj->cSFunObject.W0_BUFF_OFFSET = 65000;
    for (int b_i{0}; b_i < 130002; b_i++) {
      b_obj->W1_BUFF[b_i] = b_obj->P0_IC;
    }
    obj->cSFunObject.W3_PrevNumChan = -1;
    obj->cSFunObject.W2_PrevNumTaps = -1;
  }
  b_obj = &pFractionalDelay.cSFunObject;
  // System object Outputs function: dsp.VariableFractionalDelay
  y.set_size(x.size(0), 2, 2);
  ti = 0;
  fs = 0.0;
  if (pFractionalDelay.cSFunObject.W3_PrevNumChan == -1) {
    pFractionalDelay.cSFunObject.W3_PrevNumChan = 2;
  }
  if (pFractionalDelay.cSFunObject.W2_PrevNumTaps == -1) {
    pFractionalDelay.cSFunObject.W2_PrevNumTaps = 2;
  }
  nSamps = x.size(0);
  nrows = delayVector.size(0) << 2;
  if (nrows == 1) {
    flag = false;
    incrementDelayPerChannel = false;
  } else {
    flag = ((x.size(0) > 1) && (delayVector.size(0) == x.size(0)));
    incrementDelayPerChannel = !flag;
  }
  jtilecol = nrows / 2;
  if ((x.size(0) != 0) && (delayVector.size(0) != 0)) {
    double accumIn;
    int dlyIdx;
    int outOffset;
    boolean_T b;
    boolean_T b1;
    k = b_obj->W0_BUFF_OFFSET;
    dlyIdx = 0;
    b = !flag;
    b1 = !incrementDelayPerChannel;
    if (b && b1) {
      ti = static_cast<int>(std::floor(delayVector[0]));
      if (ti < 0) {
        ti = 0;
      } else if (ti >= 65000) {
        ti = 65000;
      } else {
        fs = delayVector[0] - static_cast<double>(ti);
      }
      dlyIdx = 1;
    }
    if (incrementDelayPerChannel) {
      ti = static_cast<int>(std::floor(delayVector[dlyIdx]));
      if (ti < 0) {
        ti = 0;
        fs = 0.0;
      } else if (ti >= 65000) {
        ti = 65000;
        fs = 0.0;
      } else {
        fs = delayVector[dlyIdx] - static_cast<double>(ti);
      }
      dlyIdx++;
    }
    for (int b_i{0}; b_i < nSamps; b_i++) {
      if (flag) {
        ti = static_cast<int>(std::floor(delayVector[dlyIdx]));
        if (ti < 0) {
          ti = 0;
          fs = 0.0;
        } else if (ti >= 65000) {
          ti = 65000;
          fs = 0.0;
        } else {
          fs = delayVector[dlyIdx] - static_cast<double>(ti);
        }
        dlyIdx++;
      }
      nrows = b_i - ti;
      if (nrows - 1 < 0) {
        ibtile = (nrows + k) - 1;
        if (ibtile < 0) {
          ibtile += 65001;
        }
        accumIn = b_obj->W1_BUFF[ibtile];
      } else {
        accumIn = x[nrows - 1];
      }
      if (nrows < 0) {
        ibtile = nrows + k;
        if (ibtile < 0) {
          ibtile += 65001;
        }
        accumIn -= b_obj->W1_BUFF[ibtile];
        y[b_i] = accumIn * fs + b_obj->W1_BUFF[ibtile];
      } else {
        accumIn -= x[nrows];
        y[b_i] = accumIn * fs + x[nrows];
      }
    }
    for (int b_i = x.size(0); b_i < nSamps; b_i++) {
      if (flag) {
        ti = static_cast<int>(std::floor(delayVector[dlyIdx]));
        if (ti < 0) {
          ti = 0;
          fs = 0.0;
        } else if (ti >= 65000) {
          ti = 65000;
          fs = 0.0;
        } else {
          fs = delayVector[dlyIdx] - static_cast<double>(ti);
        }
        dlyIdx++;
      }
      nrows = b_i - ti;
      y[b_i] = (x[nrows - 1] - x[nrows]) * fs + x[nrows];
    }
    if (flag && (jtilecol == x.size(0))) {
      dlyIdx -= jtilecol;
    }
    if (incrementDelayPerChannel) {
      ti = static_cast<int>(std::floor(delayVector[dlyIdx]));
      if (ti < 0) {
        ti = 0;
        fs = 0.0;
      } else if (ti >= 65000) {
        ti = 65000;
        fs = 0.0;
      } else {
        fs = delayVector[dlyIdx] - static_cast<double>(ti);
      }
      dlyIdx++;
    }
    for (int b_i{0}; b_i < nSamps; b_i++) {
      if (flag) {
        ti = static_cast<int>(std::floor(delayVector[dlyIdx]));
        if (ti < 0) {
          ti = 0;
          fs = 0.0;
        } else if (ti >= 65000) {
          ti = 65000;
          fs = 0.0;
        } else {
          fs = delayVector[dlyIdx] - static_cast<double>(ti);
        }
        dlyIdx++;
      }
      nrows = b_i - ti;
      if (nrows - 1 < 0) {
        ibtile = (nrows + k) - 1;
        if (ibtile < 0) {
          ibtile += 65001;
        }
        accumIn = b_obj->W1_BUFF[ibtile + 65001];
      } else {
        accumIn = x[(nrows + nSamps) - 1];
      }
      if (nrows < 0) {
        ibtile = nrows + k;
        if (ibtile < 0) {
          ibtile += 65001;
        }
        accumIn -= b_obj->W1_BUFF[ibtile + 65001];
        y[b_i + nSamps] = accumIn * fs + b_obj->W1_BUFF[ibtile + 65001];
      } else {
        accumIn -= x[nrows + nSamps];
        y[b_i + nSamps] = accumIn * fs + x[nrows + nSamps];
      }
    }
    for (int b_i = x.size(0); b_i < nSamps; b_i++) {
      if (flag) {
        ti = static_cast<int>(std::floor(delayVector[dlyIdx]));
        if (ti < 0) {
          ti = 0;
          fs = 0.0;
        } else if (ti >= 65000) {
          ti = 65000;
          fs = 0.0;
        } else {
          fs = delayVector[dlyIdx] - static_cast<double>(ti);
        }
        dlyIdx++;
      }
      nrows = b_i - ti;
      i = nrows + nSamps;
      y[b_i + nSamps] = (x[(nrows + nSamps) - 1] - x[i]) * fs + x[i];
    }
    outOffset = x.size(0) << 1;
    dlyIdx = 0;
    if (b && b1) {
      ti = static_cast<int>(std::floor(delayVector[jtilecol]));
      if (ti < 0) {
        ti = 0;
        fs = 0.0;
      } else if (ti >= 65000) {
        ti = 65000;
        fs = 0.0;
      } else {
        fs = delayVector[jtilecol] - static_cast<double>(ti);
      }
      dlyIdx = 1;
    }
    if (incrementDelayPerChannel) {
      nrows = dlyIdx + jtilecol;
      ti = static_cast<int>(std::floor(delayVector[nrows]));
      if (ti < 0) {
        ti = 0;
        fs = 0.0;
      } else if (ti >= 65000) {
        ti = 65000;
        fs = 0.0;
      } else {
        fs = delayVector[nrows] - static_cast<double>(ti);
      }
      dlyIdx++;
    }
    for (int b_i{0}; b_i < nSamps; b_i++) {
      if (flag) {
        nrows = dlyIdx + jtilecol;
        ti = static_cast<int>(std::floor(delayVector[nrows]));
        if (ti < 0) {
          ti = 0;
          fs = 0.0;
        } else if (ti >= 65000) {
          ti = 65000;
          fs = 0.0;
        } else {
          fs = delayVector[nrows] - static_cast<double>(ti);
        }
        dlyIdx++;
      }
      nrows = b_i - ti;
      if (nrows - 1 < 0) {
        ibtile = (nrows + k) - 1;
        if (ibtile < 0) {
          ibtile += 65001;
        }
        accumIn = b_obj->W1_BUFF[ibtile];
      } else {
        accumIn = x[nrows - 1];
      }
      if (nrows < 0) {
        ibtile = nrows + k;
        if (ibtile < 0) {
          ibtile += 65001;
        }
        accumIn -= b_obj->W1_BUFF[ibtile];
        y[b_i + outOffset] = accumIn * fs + b_obj->W1_BUFF[ibtile];
      } else {
        accumIn -= x[nrows];
        y[b_i + outOffset] = accumIn * fs + x[nrows];
      }
    }
    for (int b_i = x.size(0); b_i < nSamps; b_i++) {
      if (flag) {
        nrows = dlyIdx + jtilecol;
        ti = static_cast<int>(std::floor(delayVector[nrows]));
        if (ti < 0) {
          ti = 0;
          fs = 0.0;
        } else if (ti >= 65000) {
          ti = 65000;
          fs = 0.0;
        } else {
          fs = delayVector[nrows] - static_cast<double>(ti);
        }
        dlyIdx++;
      }
      nrows = b_i - ti;
      y[b_i + outOffset] = (x[nrows - 1] - x[nrows]) * fs + x[nrows];
    }
    if (flag && (jtilecol == x.size(0))) {
      dlyIdx -= jtilecol;
    }
    if (incrementDelayPerChannel) {
      nrows = dlyIdx + jtilecol;
      ti = static_cast<int>(std::floor(delayVector[nrows]));
      if (ti < 0) {
        ti = 0;
        fs = 0.0;
      } else if (ti >= 65000) {
        ti = 65000;
        fs = 0.0;
      } else {
        fs = delayVector[nrows] - static_cast<double>(ti);
      }
      dlyIdx++;
    }
    for (int b_i{0}; b_i < nSamps; b_i++) {
      if (flag) {
        nrows = dlyIdx + jtilecol;
        ti = static_cast<int>(std::floor(delayVector[nrows]));
        if (ti < 0) {
          ti = 0;
          fs = 0.0;
        } else if (ti >= 65000) {
          ti = 65000;
          fs = 0.0;
        } else {
          fs = delayVector[nrows] - static_cast<double>(ti);
        }
        dlyIdx++;
      }
      nrows = b_i - ti;
      if (nrows - 1 < 0) {
        ibtile = (nrows + k) - 1;
        if (ibtile < 0) {
          ibtile += 65001;
        }
        accumIn = b_obj->W1_BUFF[ibtile + 65001];
      } else {
        accumIn = x[(nrows + nSamps) - 1];
      }
      if (nrows < 0) {
        ibtile = nrows + k;
        if (ibtile < 0) {
          ibtile += 65001;
        }
        accumIn -= b_obj->W1_BUFF[ibtile + 65001];
        y[(b_i + nSamps) + outOffset] =
            accumIn * fs + b_obj->W1_BUFF[ibtile + 65001];
      } else {
        accumIn -= x[nrows + nSamps];
        y[(b_i + nSamps) + outOffset] = accumIn * fs + x[nrows + nSamps];
      }
    }
    for (int b_i = x.size(0); b_i < nSamps; b_i++) {
      if (flag) {
        nrows = dlyIdx + jtilecol;
        ti = static_cast<int>(std::floor(delayVector[nrows]));
        if (ti < 0) {
          ti = 0;
          fs = 0.0;
        } else if (ti >= 65000) {
          ti = 65000;
          fs = 0.0;
        } else {
          fs = delayVector[nrows] - static_cast<double>(ti);
        }
        dlyIdx++;
      }
      nrows = b_i - ti;
      i = nrows + nSamps;
      y[(b_i + nSamps) + outOffset] =
          (x[(nrows + nSamps) - 1] - x[i]) * fs + x[i];
    }
  }
  b_obj = &pFractionalDelay.cSFunObject;
  // System object Update function: dsp.VariableFractionalDelay
  if (obj->cSFunObject.W3_PrevNumChan == -1) {
    obj->cSFunObject.W3_PrevNumChan = 2;
  }
  if (obj->cSFunObject.W2_PrevNumTaps == -1) {
    obj->cSFunObject.W2_PrevNumTaps = 2;
  }
  nSamps = x.size(0);
  if ((x.size(0) != 0) && (delayVector.size(0) != 0)) {
    k = pFractionalDelay.cSFunObject.W0_BUFF_OFFSET;
    for (int b_i{0}; b_i < nSamps; b_i++) {
      b_obj->W1_BUFF[k] = x[b_i];
      if (k < 65000) {
        k++;
      } else {
        k = 0;
      }
    }
    k = pFractionalDelay.cSFunObject.W0_BUFF_OFFSET;
    for (int b_i{0}; b_i < nSamps; b_i++) {
      b_obj->W1_BUFF[k + 65001] = x[b_i + nSamps];
      if (k < 65000) {
        k++;
      } else {
        k = 0;
      }
    }
    obj->cSFunObject.W0_BUFF_OFFSET = k;
  }
  fs = WetDryMix;
  coder::sum(y, r1);
  if ((x.size(0) == r1.size(0)) && (r1.size(1) == 2)) {
    out.set_size(x.size(0), 2);
    nrows = x.size(0) * 2;
    for (i = 0; i < nrows; i++) {
      out[i] = (1.0 - fs) * x[i] + fs * r1[i];
    }
  } else {
    binary_expand_op(out, fs, x, r1);
  }
}

static void binary_expand_op(coder::array<double, 2U> &in1, double in2,
                             const coder::array<double, 2U> &in3,
                             const coder::array<double, 2U> &in4)
{
  int aux_1_1;
  int i;
  int loop_ub;
  int stride_0_0;
  int stride_1_0;
  int stride_1_1;
  if (in4.size(0) == 1) {
    i = in3.size(0);
  } else {
    i = in4.size(0);
  }
  in1.set_size(i, 2);
  stride_0_0 = (in3.size(0) != 1);
  stride_1_0 = (in4.size(0) != 1);
  stride_1_1 = (in4.size(1) != 1);
  aux_1_1 = 0;
  if (in4.size(0) == 1) {
    loop_ub = in3.size(0);
  } else {
    loop_ub = in4.size(0);
  }
  for (i = 0; i < 2; i++) {
    for (int i1{0}; i1 < loop_ub; i1++) {
      in1[i1 + in1.size(0) * i] =
          (1.0 - in2) * in3[i1 * stride_0_0 + in3.size(0) * i] +
          in2 * in4[i1 * stride_1_0 + in4.size(0) * aux_1_1];
    }
    aux_1_1 += stride_1_1;
  }
}

namespace coder {
static void sum(const ::coder::array<double, 3U> &x,
                ::coder::array<double, 2U> &y)
{
  int vlen;
  vlen = x.size(2);
  if ((x.size(0) == 0) || (x.size(1) == 0) || (x.size(2) == 0)) {
    y.set_size(static_cast<int>(static_cast<short>(x.size(0))),
               static_cast<int>(static_cast<short>(x.size(1))));
    vlen = static_cast<short>(x.size(0)) * static_cast<short>(x.size(1));
    for (int vstride{0}; vstride < vlen; vstride++) {
      y[vstride] = 0.0;
    }
  } else {
    int vstride;
    vstride = x.size(0) * x.size(1);
    y.set_size(static_cast<int>(static_cast<short>(x.size(0))),
               static_cast<int>(static_cast<short>(x.size(1))));
    for (int xj{0}; xj < vstride; xj++) {
      y[xj] = x[xj];
    }
    for (int k{2}; k <= vlen; k++) {
      for (int xj{0}; xj < vstride; xj++) {
        y[xj] = y[xj] + x[vstride + xj];
      }
    }
  }
}

} // namespace coder
static derivedAudioPlugin *getPluginInstance(ChorusStackData *SD)
{
  coder::audioOscillator *obj;
  coder::dspcodegen::VariableFractionalDelay *b_obj;
  if (!SD->pd->plugin_not_empty) {
    double fs;
    boolean_T flag;
    //  Pass constructor args to plugin.
    SD->pd->plugin.Delay = 0.02;
    SD->pd->plugin.WetDryMix = 0.5;
    SD->pd->plugin.PrivateSampleRate = 44100.0;
    SD->pd->plugin.PrivateLatency = 0;
    fs = SD->pd->plugin.PrivateSampleRate;
    std::memset(&SD->pd->plugin.pSine1.pPhaseOffset[0], 0,
                200U * sizeof(double));
    std::memset(&SD->pd->plugin.pSine1.pDCOffset[0], 0, 200U * sizeof(double));
    SD->pd->plugin.pSine1.pDutyCycle = 0.5;
    SD->pd->plugin.pSine1.pWidth = 1.0;
    SD->pd->plugin.pSine1.isInitialized = 0;
    flag = (SD->pd->plugin.pSine1.isInitialized == 1);
    if (flag) {
      SD->pd->plugin.pSine1.TunablePropsChanged = true;
    }
    for (int i{0}; i < 200; i++) {
      SD->pd->plugin.pSine1.pFrequency[i] = 0.01;
    }
    flag = (SD->pd->plugin.pSine1.isInitialized == 1);
    if (flag) {
      SD->pd->plugin.pSine1.TunablePropsChanged = true;
    }
    for (int i{0}; i < 200; i++) {
      SD->pd->plugin.pSine1.pAmplitude[i] = 0.01;
    }
    flag = (SD->pd->plugin.pSine1.isInitialized == 1);
    if (flag) {
      SD->pd->plugin.pSine1.TunablePropsChanged = true;
    }
    obj = &SD->pd->plugin.pSine1;
    obj->SampleRate = fs;
    SD->pd->plugin.pSine1.matlabCodegenIsDeleted = false;
    std::memset(&SD->pd->plugin.pSine2.pPhaseOffset[0], 0,
                200U * sizeof(double));
    std::memset(&SD->pd->plugin.pSine2.pDCOffset[0], 0, 200U * sizeof(double));
    SD->pd->plugin.pSine2.pDutyCycle = 0.5;
    SD->pd->plugin.pSine2.pWidth = 1.0;
    SD->pd->plugin.pSine2.isInitialized = 0;
    flag = (SD->pd->plugin.pSine2.isInitialized == 1);
    if (flag) {
      SD->pd->plugin.pSine2.TunablePropsChanged = true;
    }
    for (int i{0}; i < 200; i++) {
      SD->pd->plugin.pSine2.pFrequency[i] = 0.02;
    }
    flag = (SD->pd->plugin.pSine2.isInitialized == 1);
    if (flag) {
      SD->pd->plugin.pSine2.TunablePropsChanged = true;
    }
    for (int i{0}; i < 200; i++) {
      SD->pd->plugin.pSine2.pAmplitude[i] = 0.03;
    }
    flag = (SD->pd->plugin.pSine2.isInitialized == 1);
    if (flag) {
      SD->pd->plugin.pSine2.TunablePropsChanged = true;
    }
    obj = &SD->pd->plugin.pSine2;
    obj->SampleRate = fs;
    SD->pd->plugin.pSine2.matlabCodegenIsDeleted = false;
    b_obj = &SD->pd->plugin.pFractionalDelay;
    SD->pd->plugin.pFractionalDelay.isInitialized = 0;
    // System object Constructor function: dsp.VariableFractionalDelay
    b_obj->cSFunObject.P0_IC = 0.0;
    SD->pd->plugin.pFractionalDelay.matlabCodegenIsDeleted = false;
    SD->pd->plugin.pSR = fs;
    SD->pd->plugin.matlabCodegenIsDeleted = false;
    SD->pd->plugin_not_empty = true;
  }
  return &SD->pd->plugin;
}

static void getPluginInstance_free(ChorusStackData *SD)
{
  coder::audioOscillator *obj;
  coder::dspcodegen::VariableFractionalDelay *b_obj;
  if (!SD->pd->plugin.matlabCodegenIsDeleted) {
    SD->pd->plugin.matlabCodegenIsDeleted = true;
  }
  obj = &SD->pd->plugin.pSine1;
  if (!obj->matlabCodegenIsDeleted) {
    obj->matlabCodegenIsDeleted = true;
    if (obj->isInitialized == 1) {
      obj->isInitialized = 2;
    }
  }
  obj = &SD->pd->plugin.pSine2;
  if (!obj->matlabCodegenIsDeleted) {
    obj->matlabCodegenIsDeleted = true;
    if (obj->isInitialized == 1) {
      obj->isInitialized = 2;
    }
  }
  b_obj = &SD->pd->plugin.pFractionalDelay;
  if (!b_obj->matlabCodegenIsDeleted) {
    b_obj->matlabCodegenIsDeleted = true;
    if (b_obj->isInitialized == 1) {
      b_obj->isInitialized = 2;
    }
  }
}

static void getPluginInstance_init(ChorusStackData *SD)
{
  SD->pd->plugin_not_empty = false;
  SD->pd->plugin.pFractionalDelay.matlabCodegenIsDeleted = true;
  SD->pd->plugin.pSine2.matlabCodegenIsDeleted = true;
  SD->pd->plugin.pSine1.matlabCodegenIsDeleted = true;
  SD->pd->plugin.matlabCodegenIsDeleted = true;
}

static double rt_remd_snf(double u0, double u1)
{
  double y;
  if (std::isnan(u0) || std::isnan(u1) || std::isinf(u0)) {
    y = rtNaN;
  } else if (std::isinf(u1)) {
    y = u0;
  } else if ((u1 != 0.0) && (u1 != std::trunc(u1))) {
    double q;
    q = std::abs(u0 / u1);
    if (!(std::abs(q - std::floor(q + 0.5)) > DBL_EPSILON * q)) {
      y = 0.0 * u0;
    } else {
      y = std::fmod(u0, u1);
    }
  } else {
    y = std::fmod(u0, u1);
  }
  return y;
}

namespace coder {
audioOscillator::audioOscillator() = default;

audioOscillator::~audioOscillator() = default;

namespace dspcodegen {
VariableFractionalDelay::VariableFractionalDelay() = default;

VariableFractionalDelay::~VariableFractionalDelay() = default;

} // namespace dspcodegen
} // namespace coder
derivedAudioPlugin::derivedAudioPlugin() = default;

derivedAudioPlugin::~derivedAudioPlugin() = default;

void Chorus_initialize(ChorusStackData *SD)
{
  getPluginInstance_init(SD);
}

void Chorus_terminate(ChorusStackData *SD)
{
  getPluginInstance_free(SD);
}

void createPluginInstance(ChorusStackData *SD, unsigned long)
{
  getPluginInstance(SD);
}

int getLatencyInSamplesCImpl(ChorusStackData *SD)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  return plugin->PrivateLatency;
}

void onParamChangeCImpl(ChorusStackData *SD, int paramIdx, double value)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  switch (paramIdx) {
  case 0:
    plugin->Delay = value;
    break;
  case 1: {
    boolean_T flag;
    flag = (plugin->pSine1.isInitialized == 1);
    if (flag) {
      plugin->pSine1.TunablePropsChanged = true;
    }
    for (int i{0}; i < 200; i++) {
      plugin->pSine1.pAmplitude[i] = value;
    }
  } break;
  case 2: {
    boolean_T flag;
    flag = (plugin->pSine1.isInitialized == 1);
    if (flag) {
      plugin->pSine1.TunablePropsChanged = true;
    }
    for (int i{0}; i < 200; i++) {
      plugin->pSine1.pFrequency[i] = value;
    }
  } break;
  case 3: {
    boolean_T flag;
    flag = (plugin->pSine2.isInitialized == 1);
    if (flag) {
      plugin->pSine2.TunablePropsChanged = true;
    }
    for (int i{0}; i < 200; i++) {
      plugin->pSine2.pAmplitude[i] = value;
    }
  } break;
  case 4: {
    boolean_T flag;
    flag = (plugin->pSine2.isInitialized == 1);
    if (flag) {
      plugin->pSine2.TunablePropsChanged = true;
    }
    for (int i{0}; i < 200; i++) {
      plugin->pSine2.pFrequency[i] = value;
    }
  } break;
  case 5:
    plugin->WetDryMix = value;
    break;
  }
}

void processEntryPoint(ChorusStackData *SD, double samplesPerFrame,
                       const double i1_data[], const int i1_size[1],
                       const double i2_data[], const int i2_size[1],
                       double o1_data[], int o1_size[1], double o2_data[],
                       int o2_size[1])
{
  derivedAudioPlugin *plugin;
  coder::array<double, 2U> i1;
  coder::array<double, 2U> t1;
  int loop_ub;
  plugin = getPluginInstance(SD);
  i1.set_size(i1_size[0], 2);
  loop_ub = i1_size[0];
  for (int i{0}; i < loop_ub; i++) {
    i1[i] = i1_data[i];
  }
  loop_ub = i2_size[0];
  for (int i{0}; i < loop_ub; i++) {
    i1[i + i1.size(0)] = i2_data[i];
  }
  plugin->process(i1, t1);
  if (samplesPerFrame < 1.0) {
    loop_ub = 0;
  } else {
    loop_ub = static_cast<int>(samplesPerFrame);
  }
  o1_size[0] = loop_ub;
  for (int i{0}; i < loop_ub; i++) {
    o1_data[i] = t1[i];
  }
  if (samplesPerFrame < 1.0) {
    loop_ub = 0;
  } else {
    loop_ub = static_cast<int>(samplesPerFrame);
  }
  o2_size[0] = loop_ub;
  for (int i{0}; i < loop_ub; i++) {
    o2_data[i] = t1[i + t1.size(0)];
  }
}

void resetCImpl(ChorusStackData *SD, double rate)
{
  coder::dspcodegen::VariableFractionalDelay *obj;
  derivedAudioPlugin *plugin;
  dsp_VariableFractionalDelay_0 *b_obj;
  double fs;
  boolean_T flag;
  plugin = getPluginInstance(SD);
  plugin->PrivateSampleRate = rate;
  fs = plugin->PrivateSampleRate;
  plugin->pSR = fs;
  flag = (plugin->pSine1.isInitialized == 1);
  if (flag) {
    plugin->pSine1.TunablePropsChanged = true;
  }
  plugin->pSine1.SampleRate = fs;
  flag = (plugin->pSine2.isInitialized == 1);
  if (flag) {
    plugin->pSine2.TunablePropsChanged = true;
  }
  plugin->pSine2.SampleRate = fs;
  if (plugin->pSine1.isInitialized == 1) {
    plugin->pSine1.pPhase = plugin->pSine1.pPhaseOffsetCast;
    fs = plugin->pSine1.pAmplitude[0];
    plugin->pSine1.pAmplitudeCast = fs;
    fs = plugin->pSine1.pDCOffset[0];
    plugin->pSine1.pDCOffsetCast = fs;
    fs = plugin->pSine1.pDutyCycle;
    plugin->pSine1.pDutyCycleCast = fs;
    fs = plugin->pSine1.pWidth;
    plugin->pSine1.pWidthCast = fs;
    fs = plugin->pSine1.pFrequency[0];
    plugin->pSine1.pFrequencyCast = fs;
    fs = plugin->pSine1.SampleRate;
    plugin->pSine1.pPhaseStep = plugin->pSine1.pFrequencyCast / fs;
  }
  if (plugin->pSine2.isInitialized == 1) {
    plugin->pSine2.pPhase = plugin->pSine2.pPhaseOffsetCast;
    fs = plugin->pSine2.pAmplitude[0];
    plugin->pSine2.pAmplitudeCast = fs;
    fs = plugin->pSine2.pDCOffset[0];
    plugin->pSine2.pDCOffsetCast = fs;
    fs = plugin->pSine2.pDutyCycle;
    plugin->pSine2.pDutyCycleCast = fs;
    fs = plugin->pSine2.pWidth;
    plugin->pSine2.pWidthCast = fs;
    fs = plugin->pSine2.pFrequency[0];
    plugin->pSine2.pFrequencyCast = fs;
    fs = plugin->pSine2.SampleRate;
    plugin->pSine2.pPhaseStep = plugin->pSine2.pFrequencyCast / fs;
  }
  obj = &plugin->pFractionalDelay;
  if (plugin->pFractionalDelay.isInitialized == 1) {
    b_obj = &plugin->pFractionalDelay.cSFunObject;
    // System object Initialization function: dsp.VariableFractionalDelay
    obj->cSFunObject.W0_BUFF_OFFSET = 65000;
    for (int i{0}; i < 130002; i++) {
      b_obj->W1_BUFF[i] = b_obj->P0_IC;
    }
    obj->cSFunObject.W3_PrevNumChan = -1;
    obj->cSFunObject.W2_PrevNumTaps = -1;
  }
}

// End of code generation (Chorus.cpp)
