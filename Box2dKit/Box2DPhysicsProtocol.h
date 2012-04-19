//
//  Box2DPhysicsProtocol.h
//  Box2dKit
//
//  Created by Kevin Jenkins on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol Box2DPhysicsProtocol <NSObject>

- (CGPoint) position;
- (CGRect) boundingBox;
- (CGPoint) anchorPoint;
- (NSString *) objectName;

@end
