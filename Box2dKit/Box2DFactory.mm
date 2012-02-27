//
//  B2DBodyFactory.mm
//  MeowChow
//
//  Created by Kevin Jenkins on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Box2DFactory.h"
#import "Box2DHelper.h"
#import <UIKit/UIKit.h>

static b2World *world;

@implementation Box2DFactory

+ (void) setWorld:(b2World *) w {
    world = w;
}

+ () generateB2DBody:(NSObject<Box2DPhysicsProtocol> *) element {
    
    Box2DObject *b2dObj = [Box2DObject object];
    
    b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
    double xOffset = ([element anchorPoint].x - 0.5f) * [element boundary].size.width;
    double yOffset = ([element anchorPoint].y - 0.5f) * [element boundary].size.height;
    CGPoint offsetAP = CGPointMake(xOffset, yOffset);
    
    CGPoint p = CGPointMake([element position].x + offsetAP.x, 
                            [element position].y + offsetAP.y);//[element position];
    CGRect r = [element boundary];
    
    float ratio = [Box2DHelper pixelsToMeterRatio];
    
	bodyDef.position.Set(p.x/ ratio, p.y/ ratio);
	bodyDef.userData = element;
    b2Body *body = world->CreateBody(&bodyDef);
    
    b2PolygonShape dynamicBox;
    float dboxWidth = r.size.width/ratio/2.0;
    float dboxHeight = r.size.height/ratio/2.0;
    dynamicBox.SetAsBox(dboxWidth, dboxHeight);
	
    b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
    fixtureDef.isSensor = true;
	body->CreateFixture(&fixtureDef);
    
    [b2dObj setBodyDef:bodyDef];
    [b2dObj setBody:body];
    [b2dObj setDynamicBox:dynamicBox];
    [b2dObj setFixtureDef:fixtureDef];
    
    return b2dObj;
        
}
@end
