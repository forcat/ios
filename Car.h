#import <Cocoa/Cocoa.h>

@class Tire;
@class Engine;

@interface Car : NSObject <NSCopying>
{
	NSMutableArray *tires;
	NSString *name;
	Engine *engine;
}

// 属性
@property (readwrite, copy) NSString *name;
@property (readwrite, retain) Engine *engine;

// 方法
- (void) setTire: (Tire *) tire atIndex: (int) index;
- (Tire *) tireAtIndex: (int) index;
- (void) print;

@end // Car