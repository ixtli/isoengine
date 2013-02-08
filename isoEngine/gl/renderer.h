//
//  renderer.h
//  isoEngine
//
//  Created by Ixtli on 2/8/13.
//  Copyright (c) 2013 isoCo. All rights reserved.
//

#ifndef __isoEngine__renderer__
#define __isoEngine__renderer__

class Renderer
{
public:
    
    static inline Renderer* instance() { return &_instance; };
    
    bool init();
    
private:
    
    Renderer();
    ~Renderer();
    
    DISALLOW_COPY_AND_ASSIGN(Renderer);
    
    static Renderer _instance;
};

#endif /* defined(__isoEngine__renderer__) */
