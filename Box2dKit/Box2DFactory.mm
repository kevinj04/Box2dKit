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

#define kOffsetIPadX 0.0
#define kOffsetIPadY 0.0

static b2World *world;

@interface Box2DFactory (hidden)
- (CGPoint) scalePointForIPad:(CGPoint) p;
- (CGPoint) scalePointFromIPad:(CGPoint) p;
+ (CGRect) scaleRectFromIPad:(CGRect) r;
+ (CGRect) scaleRectForIPad:(CGRect) r;
@end

@implementation Box2DFactory (hidden)
- (CGPoint) scalePointForIPad:(CGPoint) p {
    // ipad actions need to be twice as large, maybe old iphone too?
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGPointMake(p.x*2.0+kOffsetIPadX, p.y*2.0+kOffsetIPadY);
    } else {
        return p;
    }
}
- (CGPoint) scalePointFromIPad:(CGPoint) p {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGPointMake((p.x - kOffsetIPadX) *0.5, (p.y - kOffsetIPadY)*0.5);
    } else {
        return p;
    }
}
+ (CGRect) scaleRectFromIPad:(CGRect) r {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGRectMake((r.origin.x - kOffsetIPadX)*0.5, (r.origin.y-kOffsetIPadY)*0.5, r.size.width*0.5, r.size.height*0.5);
    } else {
        return r;
    }
}
+ (CGRect) scaleRectForIPad:(CGRect) r {
    // ipad actions need to be twice as large, maybe old iphone too?
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGRectMake(r.origin.x*2.0+kOffsetIPadX, r.origin.y*2.0+kOffsetIPadY, r.size.width*2.0, r.size.height*2.0);
    } else {
        return r;
    }
}


@end

@implementation Box2DFactory

+ (void) setWorld:(b2World *) w {
    world = w;
}

+ () generateB2DBody:(NSObject<Box2DPhysicsProtocol> *) element {
    
    Box2DObject *b2dObj = [Box2DObject object];
    
    b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;

    NSString *oName = [element objectName];
    CGRect elementRect = [element boundingBox];
    NSLog(@"Object[%@] has bounding box %@", oName, NSStringFromCGRect(elementRect));
        
    // We can possibly delete this 2.0 division.
    double xOffset = ([element anchorPoint].x - 0.5f) * [element boundingBox].size.width/2.0;
    double yOffset = ([element anchorPoint].y - 0.5f) * [element boundingBox].size.height/2.0;
    CGPoint offsetAP = CGPointMake(xOffset, yOffset);
    
    CGPoint p = CGPointMake([element position].x - offsetAP.x, 
                            [element position].y - offsetAP.y);//[element position];
    CGRect r = [self scaleRectFromIPad:[element boundingBox]];
    
    float ratio = [Box2DHelper pixelsToMeterRatio];
    
	bodyDef.position.Set(p.x/ ratio, p.y/ ratio);
	bodyDef.userData = element;
    b2Body *body = world->CreateBody(&bodyDef);
    
    b2PolygonShape dynamicBox;
    float dboxWidth = r.size.width/ratio;
    float dboxHeight = r.size.height/ratio;
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
+ (void) destroyB2DBody:(Box2DObject *) b2dObj {
    
    world->DestroyBody([b2dObj body]);
    
}
@end
