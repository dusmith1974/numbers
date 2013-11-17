//
//  timings.cc
//  euler
//
//  Created by Duncan Smith on 19/10/2013.
//  Copyright (c) 2013 Duncan Smith. All rights reserved.
//

#include "timings.h"

#include <chrono>
#include <iostream>
#include <sstream>

std::string add_timestamp(const SteadyTimepointPair& timepoints) {
  auto micro = std::chrono::duration_cast<std::chrono::microseconds>(timepoints.second - timepoints.first);
  auto milli = std::chrono::duration_cast<std::chrono::milliseconds>(timepoints.second - timepoints.first);
  auto sec = std::chrono::duration_cast<std::chrono::seconds>(timepoints.second - timepoints.first);
  
  std::stringstream ss;
  if (sec.count())
    ss << " in " << sec.count() << " seconds." << std::endl;
  else if (milli.count())
    ss << " in " << milli.count() << " milli-seconds." << std::endl;
  else
    ss << " in " << micro.count() << " micro-seconds." << std::endl;
  
  return (std::string(ss.str()));
}
