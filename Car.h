#import <Cocoa/Cocoa.h>
//#import "Tire.h"
@class Tire;
@class Engine;
@class Slant6;

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
+ (void) ShowMyCar;

@end // Car