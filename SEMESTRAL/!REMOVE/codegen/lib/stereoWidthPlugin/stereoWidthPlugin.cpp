//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// stereoWidthPlugin.cpp
//
// Code generation for function 'stereoWidthPlugin'
//

// Include files
#include "stereoWidthPlugin.h"
#include "stereoWidthPlugin_types.h"
#include "coder_array.h"

// Function Declarations
static derivedAudioPlugin *getPluginInstance(stereoWidthPluginStackData *SD);

static void getPluginInstance_free(stereoWidthPluginStackData *SD);

static void getPluginInstance_init(stereoWidthPluginStackData *SD);

// Function Definitions
static derivedAudioPlugin *getPluginInstance(stereoWidthPluginStackData *SD)
{
  if (!SD->pd->plugin_not_empty) {
    //  Pass constructor args to plugin.
    SD->pd->plugin.Width = 1.5;
    SD->pd->plugin.PrivateLatency = 0;
    SD->pd->plugin.matlabCodegenIsDeleted = false;
    SD->pd->plugin_not_empty = true;
  }
  return &SD->pd->plugin;
}

static void getPluginInstance_free(stereoWidthPluginStackData *SD)
{
  if (!SD->pd->plugin.matlabCodegenIsDeleted) {
    SD->pd->plugin.matlabCodegenIsDeleted = true;
  }
}

static void getPluginInstance_init(stereoWidthPluginStackData *SD)
{
  SD->pd->plugin_not_empty = false;
  SD->pd->plugin.matlabCodegenIsDeleted = true;
}

derivedAudioPlugin::derivedAudioPlugin() = default;

derivedAudioPlugin::~derivedAudioPlugin() = default;

void createPluginInstance(stereoWidthPluginStackData *SD, unsigned long)
{
  getPluginInstance(SD);
}

int getLatencyInSamplesCImpl(stereoWidthPluginStackData *SD)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  return plugin->PrivateLatency;
}

void onParamChangeCImpl(stereoWidthPluginStackData *SD, int paramIdx,
                        double value)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  if (paramIdx == 0) {
    //  set method
    plugin->Width = value;
  }
}

void processEntryPoint(stereoWidthPluginStackData *SD, double samplesPerFrame,
                       const double i1_data[], const int i1_size[1],
                       const double i2_data[], const int i2_size[1],
                       double o1_data[], int o1_size[1], double o2_data[],
                       int o2_size[1])
{
  derivedAudioPlugin *plugin;
  coder::array<double, 2U> t1;
  double mid_data[4096];
  double side_data[4096];
  double b;
  int loop_ub;
  int mid_size;
  plugin = getPluginInstance(SD);
  t1.set_size(i1_size[0], 2);
  loop_ub = i1_size[0];
  for (int i{0}; i < loop_ub; i++) {
    t1[i] = i1_data[i];
  }
  loop_ub = i2_size[0];
  for (int i{0}; i < loop_ub; i++) {
    t1[i + t1.size(0)] = i2_data[i];
  }
  //  process method
  //  Define processing here
  mid_size = t1.size(0);
  loop_ub = t1.size(0);
  for (int i{0}; i < loop_ub; i++) {
    mid_data[i] = (t1[i] + t1[i + t1.size(0)]) / 2.0;
  }
  b = plugin->Width;
  loop_ub = t1.size(0);
  for (int i{0}; i < loop_ub; i++) {
    side_data[i] = (t1[i] - t1[i + t1.size(0)]) / 2.0 * b;
  }
  t1.set_size(mid_size, 2);
  for (int i{0}; i < mid_size; i++) {
    t1[i] = mid_data[i] + side_data[i];
  }
  for (int i{0}; i < mid_size; i++) {
    t1[i + t1.size(0)] = mid_data[i] - side_data[i];
  }
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

void resetCImpl(stereoWidthPluginStackData *SD, double)
{
  getPluginInstance(SD);
  //  reset method
}

void stereoWidthPlugin_initialize(stereoWidthPluginStackData *SD)
{
  getPluginInstance_init(SD);
}

void stereoWidthPlugin_terminate(stereoWidthPluginStackData *SD)
{
  getPluginInstance_free(SD);
}

// End of code generation (stereoWidthPlugin.cpp)
