//
//  timings.h
//  euler
//
//  Created by Duncan Smith on 19/10/2013.
//  Copyright (c) 2013 Duncan Smith. All rights reserved.
//

#ifndef __euler__timings__
#define __euler__timings__

#include <iostream>
#include <utility>
#include <chrono>

typedef std::chrono::time_point<std::chrono::steady_clock> SteadyTimepoint;
typedef std::pair<SteadyTimepoint, SteadyTimepoint> SteadyTimepointPair;

std::string add_timestamp(const SteadyTimepointPair& timepoints);

#endif /* defined(__euler__timings__) */
