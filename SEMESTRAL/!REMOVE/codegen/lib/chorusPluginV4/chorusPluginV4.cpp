//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// chorusPluginV4.cpp
//
// Code generation for function 'chorusPluginV4'
//

// Include files
#include "chorusPluginV4.h"
#include "chorusPluginV4_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cmath>

// Function Declarations
namespace coder {
static double b_mod(double x, double y);

}
static derivedAudioPlugin *getPluginInstance(chorusPluginV4StackData *SD);

static void getPluginInstance_free(chorusPluginV4StackData *SD);

static void getPluginInstance_init(chorusPluginV4StackData *SD);

// Function Definitions
namespace coder {
static double b_mod(double x, double y)
{
  double r;
  r = x;
  if (y == 0.0) {
    if (x == 0.0) {
      r = y;
    }
  } else if (std::isnan(x) || std::isnan(y) || std::isinf(x)) {
    r = rtNaN;
  } else if (x == 0.0) {
    r = 0.0 / y;
  } else if (std::isinf(y)) {
    if ((y < 0.0) != (x < 0.0)) {
      r = y;
    }
  } else {
    boolean_T rEQ0;
    r = std::fmod(x, y);
    rEQ0 = (r == 0.0);
    if ((!rEQ0) && (y > std::floor(y))) {
      double q;
      q = std::abs(x / y);
      rEQ0 = !(std::abs(q - std::floor(q + 0.5)) > 2.2204460492503131E-16 * q);
    }
    if (rEQ0) {
      r = y * 0.0;
    } else if ((x < 0.0) != (y < 0.0)) {
      r += y;
    }
  }
  return r;
}

} // namespace coder
static derivedAudioPlugin *getPluginInstance(chorusPluginV4StackData *SD)
{
  if (!SD->pd->plugin_not_empty) {
    double rate;
    int unnamed_idx_0;
    //  Pass constructor args to plugin.
    SD->pd->plugin.Depth = 5.0;
    SD->pd->plugin.Rate = 0.5;
    SD->pd->plugin.Wet = 30.0;
    SD->pd->plugin.Predelay = 30.0;
    SD->pd->plugin.currentPhase = 0.0;
    //  constructor
    SD->pd->plugin.PrivateSampleRate = 44100.0;
    SD->pd->plugin.PrivateLatency = 0;
    //  initialize delay line
    rate = SD->pd->plugin.PrivateSampleRate;
    SD->pd->plugin.sampleRate = rate;
    rate = 0.05 * SD->pd->plugin.sampleRate;
    rate = std::ceil(rate);
    SD->pd->plugin.maxDelay = rate;
    //  samples
    // disp("maxDelay = " + p.maxDelay);
    unnamed_idx_0 = static_cast<int>(SD->pd->plugin.maxDelay);
    SD->pd->plugin.DelayLine.set_size(unnamed_idx_0, 2);
    unnamed_idx_0 <<= 1;
    for (int i{0}; i < unnamed_idx_0; i++) {
      SD->pd->plugin.DelayLine[i] = 0.0;
    }
    SD->pd->plugin.DelayLineLength = SD->pd->plugin.maxDelay;
    SD->pd->plugin.DelayLineIndex = 1.0;
    SD->pd->plugin.mix = SD->pd->plugin.Wet / 100.0;
    //  convert to 0 to 1
    SD->pd->plugin.angleChange = SD->pd->plugin.Rate *
                                 (1.0 / SD->pd->plugin.sampleRate) * 2.0 *
                                 3.1415926535897931;
    SD->pd->plugin.matlabCodegenIsDeleted = false;
    SD->pd->plugin_not_empty = true;
  }
  return &SD->pd->plugin;
}

static void getPluginInstance_free(chorusPluginV4StackData *SD)
{
  if (!SD->pd->plugin.matlabCodegenIsDeleted) {
    SD->pd->plugin.matlabCodegenIsDeleted = true;
  }
}

static void getPluginInstance_init(chorusPluginV4StackData *SD)
{
  SD->pd->plugin_not_empty = false;
  SD->pd->plugin.matlabCodegenIsDeleted = true;
}

derivedAudioPlugin::derivedAudioPlugin() = default;

derivedAudioPlugin::~derivedAudioPlugin() = default;

void chorusPluginV4_initialize(chorusPluginV4StackData *SD)
{
  getPluginInstance_init(SD);
}

void chorusPluginV4_terminate(chorusPluginV4StackData *SD)
{
  getPluginInstance_free(SD);
}

void createPluginInstance(chorusPluginV4StackData *SD, unsigned long)
{
  getPluginInstance(SD);
}

int getLatencyInSamplesCImpl(chorusPluginV4StackData *SD)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  return plugin->PrivateLatency;
}

void onParamChangeCImpl(chorusPluginV4StackData *SD, int paramIdx, double value)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  switch (paramIdx) {
  case 0:
    //  reset
    //  set methods
    plugin->Depth = value;
    //  update depth
    break;
  case 1: {
    double Fs;
    //  set.Depth
    Fs = plugin->PrivateSampleRate;
    plugin->Rate = value;
    plugin->angleChange = plugin->Rate * (1.0 / Fs) * 2.0 * 3.1415926535897931;
    //  update angle change per sample
  } break;
  case 2:
    //  set.Rate
    plugin->Wet = value;
    plugin->mix = plugin->Wet / 100.0;
    break;
  case 3:
    //  set.Wet
    // Fs = getSampleRate(p);
    plugin->Predelay = value;
    // disp("Predelay = " + p.Predelay);
    // p.maxDelay = ceil(Fs * p.Predelay / 1000); % samples
    // p.DelayLine = zeros(p.maxDelay, 2);
    // disp("maxDelay = " + p.maxDelay);
    // disp("Buffer size: " + size(p.DelayLine));
    // p.DelayLineLength = p.maxDelay;
    // p.DelayLineIndex = 1;
    break;
  }
}

void processEntryPoint(chorusPluginV4StackData *SD, double samplesPerFrame,
                       const double i1_data[], const int i1_size[1],
                       const double i2_data[], const int i2_size[1],
                       double o1_data[], int o1_size[1], double o2_data[],
                       int o2_size[1])
{
  derivedAudioPlugin *plugin;
  coder::array<double, 2U> drySig;
  coder::array<double, 2U> result;
  coder::array<double, 2U> t1;
  coder::array<double, 2U> wetSig;
  double len;
  int i;
  int loop_ub;
  plugin = getPluginInstance(SD);
  result.set_size(i1_size[0], 2);
  loop_ub = i1_size[0];
  for (i = 0; i < loop_ub; i++) {
    result[i] = i1_data[i];
  }
  loop_ub = i2_size[0];
  for (i = 0; i < loop_ub; i++) {
    result[i + result.size(0)] = i2_data[i];
  }
  //  constructor
  //  process method
  t1.set_size(result.size(0), 2);
  drySig.set_size(result.size(0), 2);
  loop_ub = result.size(0) << 1;
  for (i = 0; i < loop_ub; i++) {
    drySig[i] = 0.0;
  }
  wetSig.set_size(result.size(0), 2);
  loop_ub = result.size(0) << 1;
  for (i = 0; i < loop_ub; i++) {
    wetSig[i] = 0.0;
  }
  // size(p.DelayLine)
  len = plugin->DelayLineLength;
  // [a, b] = size(p.DelayLine);
  // disp("Buffer size = " + a + " x " + b);
  // p.mix = p.Wet / 100; % convert to 0 to 1
  i = result.size(0);
  for (int n{0}; n < i; n++) {
    double b_idx_0;
    double b_idx_1;
    double frac;
    double indexC;
    double intDelay;
    double lfoMS;
    //  calculate delay time
    lfoMS = plugin->currentPhase;
    lfoMS = std::sin(lfoMS);
    lfoMS = plugin->Depth * lfoMS + plugin->Predelay;
    //  in ms
    lfoMS = coder::b_mod(plugin->DelayLineIndex - lfoMS, len) + 1.0;
    //  Fractional delay
    intDelay = std::floor(lfoMS);
    //  Integer delay
    frac = lfoMS - intDelay;
    //  Fractional part of delay
    //  calculate delay line indices
    indexC = coder::b_mod(plugin->DelayLineIndex - 1.0, len) + 1.0;
    //  current index
    //  next index
    //  calculate output
    drySig[n] = result[n];
    drySig[n + drySig.size(0)] = result[n + result.size(0)];
    //  Debug output
    // disp("intDelay = " + intDelay + ", nextIndex = " + nextIndex + ", frac =
    // " + frac + ", indexC = " + indexC + ", len = " + len);
    //  calculate wet signal
    b_idx_0 = plugin->DelayLine[static_cast<int>(intDelay) - 1];
    b_idx_1 = plugin->DelayLine[(static_cast<int>(intDelay) +
                                 plugin->DelayLine.size(0)) -
                                1];
    loop_ub = static_cast<int>(coder::b_mod(intDelay, len) + 1.0);
    lfoMS = plugin->DelayLine[loop_ub - 1];
    intDelay = plugin->DelayLine[(loop_ub + plugin->DelayLine.size(0)) - 1];
    wetSig[n] = (1.0 - frac) * b_idx_0 + frac * lfoMS;
    wetSig[n + wetSig.size(0)] = (1.0 - frac) * b_idx_1 + frac * intDelay;
    //  mix dry and wet signals
    // out(n, :) = (1 - p.mix) * drySig(n, :) + p.mix * wetSig(n, :);
    lfoMS = 1.0 - plugin->mix;
    intDelay = plugin->mix;
    t1[n] = lfoMS * drySig[n] + intDelay * wetSig[n];
    t1[n + t1.size(0)] = lfoMS * drySig[n + drySig.size(0)] +
                         intDelay * wetSig[n + wetSig.size(0)];
    //  update delay line
    plugin->DelayLine[static_cast<int>(indexC) - 1] = result[n];
    plugin->DelayLine[(static_cast<int>(indexC) + plugin->DelayLine.size(0)) -
                      1] = result[n + result.size(0)];
    //  update delay line index (circular buffer)
    plugin->DelayLineIndex++;
    if (plugin->DelayLineIndex > plugin->maxDelay) {
      plugin->DelayLineIndex = 1.0;
    }
    //  update LFO phase
    plugin->currentPhase += plugin->angleChange;
    if (plugin->currentPhase > 6.2831853071795862) {
      plugin->currentPhase -= 6.2831853071795862;
    }
  }
  //  for
  if (samplesPerFrame < 1.0) {
    loop_ub = 0;
  } else {
    loop_ub = static_cast<int>(samplesPerFrame);
  }
  o1_size[0] = loop_ub;
  for (i = 0; i < loop_ub; i++) {
    o1_data[i] = t1[i];
  }
  if (samplesPerFrame < 1.0) {
    loop_ub = 0;
  } else {
    loop_ub = static_cast<int>(samplesPerFrame);
  }
  o2_size[0] = loop_ub;
  for (i = 0; i < loop_ub; i++) {
    o2_data[i] = t1[i + t1.size(0)];
  }
}

void resetCImpl(chorusPluginV4StackData *SD, double rate)
{
  derivedAudioPlugin *plugin;
  double b_rate;
  int plugin_idx_0;
  plugin = getPluginInstance(SD);
  plugin->PrivateSampleRate = rate;
  //  process
  //  reset method
  b_rate = plugin->PrivateSampleRate;
  plugin->sampleRate = b_rate;
  //  update sample rate
  b_rate = 0.05 * plugin->sampleRate;
  b_rate = std::ceil(b_rate);
  plugin->maxDelay = b_rate;
  //  samples
  plugin_idx_0 = static_cast<int>(plugin->maxDelay);
  plugin->DelayLine.set_size(plugin_idx_0, 2);
  plugin_idx_0 <<= 1;
  for (int i{0}; i < plugin_idx_0; i++) {
    plugin->DelayLine[i] = 0.0;
  }
  plugin->DelayLineIndex = 1.0;
  plugin->DelayLineLength = plugin->maxDelay;
  plugin->currentPhase = 0.0;
}

// End of code generation (chorusPluginV4.cpp)
