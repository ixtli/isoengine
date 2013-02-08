//
//  log.h
//  isoEngine
//
//  Created by Ixtli on 2/8/13.
//  Copyright (c) 2013 isoCo. All rights reserved.
//

#ifndef __isoEngine__log__
#define __isoEngine__log__

#ifdef DEBUG

#include <stdio.h>
#include <string.h>

#define THIS_FILE ((strrchr(__FILE__, '/') ?: __FILE__ - 1) + 1)

#define d(...) printf("%s:%d: ", THIS_FILE, __LINE__);    \
                            printf(__VA_ARGS__)

#endif

#endif /* defined(__isoEngine__log__) */
