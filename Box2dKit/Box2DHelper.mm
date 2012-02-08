#import "Box2DHelper.h"
#import "cocos2d.h"

const float kPointsToMeterRatio = 32.0f;

@implementation Box2DHelper

+(b2Vec2) toMeters:(CGPoint)point
{
	return b2Vec2(point.x / kPointsToMeterRatio, point.y / kPointsToMeterRatio);
}

+(b2Vec2) toMetersFromPixels:(CGPoint)point
{
	return b2Vec2(point.x / [Box2DHelper pixelsToMeterRatio], point.y / [Box2DHelper pixelsToMeterRatio]);
}

+(CGPoint) toPoints:(b2Vec2)vec
{
	return ccpMult(CGPointMake(vec.x, vec.y), kPointsToMeterRatio);
}

+(CGPoint) toPixels:(b2Vec2)vec
{
	return ccpMult(CGPointMake(vec.x, vec.y), [Box2DHelper pixelsToMeterRatio]);
}

+(float) pointsToMeterRatio
{
	return (kPointsToMeterRatio);
}

+(float) pixelsToMeterRatio
{
    return (CC_CONTENT_SCALE_FACTOR() * kPointsToMeterRatio);
}

@end