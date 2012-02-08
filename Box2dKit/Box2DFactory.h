//
//  B2DBodyFactory.h
//  MeowChow
//
//  Created by Kevin Jenkins on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box2DPhysicsProtocol.h"
#import "Box2D.h"
#import "Box2DObject.h"

@interface Box2DFactory : NSObject

+ (void) setWorld:(b2World *) w;

+ (Box2DObject *) generateB2DBody:(NSObject<Box2DPhysicsProtocol> *) element;
//+ (void) generateB2DBodyForTongue:(MCTongue *) tongue;

@end
