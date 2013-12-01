//
//  timings.h
//  numbers
//
//  Created by Duncan Smith on 19/10/2013.
//  Copyright (c) 2013 Duncan Smith. All rights reserved.
//

#ifndef __numbers__timings__
#define __numbers__timings__

#include <iostream>
#include <utility>
#include <chrono>

typedef std::chrono::time_point<std::chrono::steady_clock> SteadyTimepoint;
typedef std::pair<SteadyTimepoint, SteadyTimepoint> SteadyTimepointPair;

std::string add_timestamp(const SteadyTimepointPair& timepoints);

#endif /* defined(__numbers__timings__) */
