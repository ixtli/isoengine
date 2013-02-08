//
//  renderer.cpp
//  isoEngine
//
//  Created by Ixtli on 2/8/13.
//  Copyright (c) 2013 isoCo. All rights reserved.
//

#include "log.h"

#include "renderer.h"

Renderer Renderer::_instance;

Renderer::Renderer()
{}

Renderer::~Renderer()
{
    
}

bool Renderer::init()
{
    d("Initializing.");
    
    return true;
}

