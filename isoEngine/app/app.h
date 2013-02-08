//
//  app.h
//  isoEngine
//
//  Created by Ixtli on 2/8/13.
//  Copyright (c) 2013 isoCo. All rights reserved.
//

#ifndef __isoEngine__app__
#define __isoEngine__app__

class Application
{
public:
    
    static inline Application* instance() { return &_instance; };
    
    bool init();
    
private:
    
    DISALLOW_COPY_AND_ASSIGN(Application);
    
    Application();
    ~Application();
    
    static Application _instance;
    
};

#endif /* defined(__isoEngine__app__) */
