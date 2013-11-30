//  main.cpp
//  numbers
//
//  Created by Duncan Smith on 19/10/2013.
//  Copyright (c) 2013 Duncan Smith. All rights reserved.

#include <iostream>
//#include <boost/shared_ptr.hpp>

#include "projects/all_projects.h"

int main(int argc, const char * argv[])
{
  const int max_multiple = 1e6;
  
  project_1(max_multiple);
  project_1_s(max_multiple);
}

