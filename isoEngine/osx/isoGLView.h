//
//  isoGLView.h
//  isoEngine
//
//  Created by Ixtli on 1/26/13.
//  Copyright (c) 2013 isoCo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/CVDisplayLink.h>

@interface isoGLView : NSOpenGLView
{
    CVDisplayLinkRef displayLink;
}

@end
