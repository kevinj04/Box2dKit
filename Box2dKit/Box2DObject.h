//
//  MCBox2dObject.h
//  MeowChow
//
//  Created by Kevin Jenkins on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box2D.h"
#import "GLES-Render.h"

@interface Box2DObject : NSObject {
    
    b2Body *body;
    b2BodyDef bodyDef;
    b2PolygonShape dynamicBox;
    b2FixtureDef fixtureDef;
    
}

/** @brief Box2D Body Representation, necessary for establishing a physical presence. */
@property  b2Body *body;
/** @brief Box2D Body definition. */
@property b2BodyDef bodyDef;
/** @brief Shape description for the box2d physics body. */
@property b2PolygonShape dynamicBox;
/** @brief Definition of the fixture for this object. */
@property b2FixtureDef fixtureDef;

- (id) init;
+ (id) object;
- (void) dealloc;

@end
