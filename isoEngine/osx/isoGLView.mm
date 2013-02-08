//
//  isoGLView.m
//  isoEngine
//
//  Created by Ixtli on 1/26/13.
//  Copyright (c) 2013 isoCo. All rights reserved.
//

#import "isoGLView.h"

#include "../app/app.h"

@interface isoGLView (PrivateMethods)
- (void) initGL;
- (void) drawView;
@end

@implementation isoGLView

static CVReturn displayLinkCallback(CVDisplayLinkRef displayLink,
                                    const CVTimeStamp* inNow,
                                    const CVTimeStamp* inOutputTime,
                                    CVOptionFlags flagsIn,
                                    CVOptionFlags* flagsOut,
                                    void* displayLinkContext)
{
    
    return kCVReturnSuccess;
}

- (void) awakeFromNib
{
    // Called when the view is instantiated
    static const NSOpenGLPixelFormatAttribute attrs[] =
	{
		NSOpenGLPFADoubleBuffer,
		NSOpenGLPFADepthSize, 24,
		// Must specify the 3.2 Core Profile to use OpenGL 3.2
		NSOpenGLPFAOpenGLProfile,
		NSOpenGLProfileVersion3_2Core,
		0
	};
    
    NSOpenGLPixelFormat* pf = [[NSOpenGLPixelFormat alloc] initWithAttributes:
                               attrs];
    
    if (!pf)
    {
        NSLog(@"No pixel format.  Perhaps the machine doesn't support OGL3.2?");
    }
    
    NSOpenGLContext* context = [[NSOpenGLContext alloc] initWithFormat:pf
                                                          shareContext:nil];
    
    [self setPixelFormat:pf];
    [self setOpenGLContext:context];
}

- (void) prepareOpenGL
{
    [super prepareOpenGL];
    
    // Do the application OpenGL init
    [self initGL];
    
    // Make our display link active
    CVDisplayLinkCreateWithActiveCGDisplays(&displayLink);
    
    // Set the function Core Video will call when it wants a new frame
    CVDisplayLinkSetOutputCallback(displayLink, displayLinkCallback, NULL);
    
    // Set the display link's GL context
    CGLContextObj cglContext = (CGLContextObj)[[self openGLContext]
                                               CGLContextObj];
    
    if (!cglContext)
    {
        NSLog(@"Could not get CGLContextObj from openGLContext.");
        return;
    }
    
    CGLPixelFormatObj cglPixelFormat = (CGLPixelFormatObj)[[self pixelFormat]
                                                           CGLPixelFormatObj];
    
    if (!cglPixelFormat)
    {
        NSLog(@"Could not get CGLPixelFormatObj from self.");
        return;
    }
    
    CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext(displayLink,
                                                      cglContext,
                                                      cglPixelFormat);
    
    CVDisplayLinkStart(displayLink);
}

- (void) initGL
{
    [[self openGLContext] makeCurrentContext];
    
    // This synchronizes buffer swaps with vertical refresh rate
    GLint swapInt = 1;
    [[self openGLContext] setValues:&swapInt
                       forParameter:NSOpenGLCPSwapInterval];
    
    Application::instance()->init();
}

- (void) dealloc
{
    // Stop the display link BEFORE releasing anything in the view
    // otherwise the display link thread may call into the view and crash
    // when it encounters something that has been release
    CVDisplayLinkStop(displayLink);
    
    // Now clean up
    CVDisplayLinkRelease(displayLink);
}

@end
