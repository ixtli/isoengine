//
//  app.cpp
//  isoEngine
//
//  Created by Ixtli on 2/8/13.
//  Copyright (c) 2013 isoCo. All rights reserved.
//

#include "app.h"

#include "log.h"

Application Application::_instance;

Application::Application()
{}

Application::~Application()
{
    
}

bool Application::init()
{
    d("Initializing.\n");
    
    return true;
}

