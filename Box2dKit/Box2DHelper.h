#import "Box2D.h"
#import <UIKit/UIKit.h>

// From: http://cocos2d-central.com/page/index.html/_/retina-hd/proper-retina-content-scaling-with-box2d-r13

@interface Box2DHelper : NSObject {}

/** converts a point coordinate to Box2D meters */
+(b2Vec2) toMeters:(CGPoint)point;

/** converts a PIXEL coordinate to Box2D meters */
+(b2Vec2) toMetersFromPixels:(CGPoint)point;

/** converts a box2d position to point coordinates */
+(CGPoint) toPoints:(b2Vec2)vec;

/** converts a box2d position to PIXEL coordinates */
+(CGPoint) toPixels:(b2Vec2)vec;

/** returns the pixels-to-meter ratio scaled to the device's pixel size */
+(float) pixelsToMeterRatio;

@end