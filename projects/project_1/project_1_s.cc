//
//  project1_s.cpp
//  numbers
//
//  Created by Duncan Smith on 22/10/2013.
//  Copyright (c) 2013 Duncan Smith. All rights reserved.
//

#include "project_1_s.h"
#include "timings.h"

// 1. how many times does 3 go into 9? (quo)
// 2. 3 + 6 + 9 = 18 == divisor * (sum(1,2,...,quo))
// 3. sum(1,2,...n) == (0.5 * n) * n + 1
long long add_multiples_for_n(const int max_multiple, const int divisor) {
  int quo = (max_multiple - 1) / divisor;
  long long sum_1_quo = (0.5 * quo) * (quo + 1);
  long long sum_multiples = sum_1_quo * divisor;
  
  return sum_multiples;;
}

// quick calc of sum of multiples of 3 + sum of multiples of 5 less sum of
// multiples of 15 (to remove duplicates of 3 and 5).
long long add_multiples_s(const int max_multiple) {
  long long sum_multiples = add_multiples_for_n(max_multiple, 3);
  sum_multiples += add_multiples_for_n(max_multiple, 5);
  sum_multiples -= add_multiples_for_n(max_multiple, 3 * 5);
  
  return sum_multiples;
}

// solution
void project_1_s(const int max_multiple /* = 1e3 */) {
  auto tic = std::chrono::steady_clock::now();
  long long sum = add_multiples_s(max_multiple);
  auto toc = std::chrono::steady_clock::now();
  
  std::cout << "project_1_s: " << sum << add_timestamp(std::make_pair(tic, toc));
}
