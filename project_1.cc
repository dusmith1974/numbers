//
//  project_1.cc
//  euler
//
//  Created by Duncan Smith on 19/10/2013.
//  Copyright (c) 2013 Duncan Smith. All rights reserved.
//

#include <chrono>
#include <iostream>
#include <numeric>
#include <vector>

#include "project_1.h"
#include "timings.h"

void find_multiples(const int max_multiple, std::vector<int>* multiples) {
  if (!multiples) return;
  
  for (int m = 1; m < max_multiple; ++ m)
    if (0 == m % 3 || 0 == m % 5)
      multiples->push_back(m);
}

long add_multiples(const int max_multiple) {
  std::vector<int> multiples;
  
  multiples.reserve(50);
  find_multiples(max_multiple, &multiples);
  
  return std::accumulate(multiples.begin(), multiples.end(),
                         static_cast<long>(0));
}

// brute force
void project_1(const int max_multiple /* = 1e3 */) {
  auto tic = std::chrono::steady_clock::now();
  long sum = add_multiples(max_multiple);
  auto toc = std::chrono::steady_clock::now();

  std::cout << "project_1: " << sum << add_timestamp(std::make_pair(tic, toc));
}



