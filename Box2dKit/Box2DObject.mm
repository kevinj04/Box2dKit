//
//  MCBox2dObject.mm
//  MeowChow
//
//  Created by Kevin Jenkins on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Box2DObject.h"


@implementation Box2DObject
@synthesize body, bodyDef, dynamicBox, fixtureDef;

- (id) init {
    
    if (( self = [super init] )) {
        
        body = nil;        
        
        return self;
    } else {
        return nil;
    }
    
}
+ (id) object {
    return [[[Box2DObject alloc] init] autorelease];
}
- (void) dealloc {
    [super dealloc];
}

@end
