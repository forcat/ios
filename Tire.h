#import <Cocoa/Cocoa.h>

@interface Tire : NSObject <NSCopying>
{
	float pressure;
	float treadDepth;
}

// 胎压
@property float pressure;
// 
@property float treadDepth;

- (id) initWithPressure: (float) pressure 
		treadDepth: (float) treadDepth;
@end // Tire