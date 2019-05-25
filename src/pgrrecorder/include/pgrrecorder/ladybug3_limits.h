#ifndef _LADYBUG_LIMITS_H_
#define _LADYBUG_LIMITS_H_

// GPH Added
static const int kGainMin = -2.25;
static const int kGainMax = 24.0;
static const int kBrightnessMin = 0.0;
static const int kBrightnessMax = 6.24;
static const int kAutoExposureMin = -7.58;
static const int kAutoExposureMax = 2.41;
static const int kWhiteBalanceMin = 0;
static const int kWhiteBalanceMax = 1023;
static const int kGammaMin = 0.5;
static const int kGammaMax = 4.0;
static const int kShutterMin = 0.01;   // time in seconds (Technical Ref. p.8)
static const int kShutterMax = 4.2;
// End GPH

#endif
