#import <Cocoa/Cocoa.h>
#import "Tire.h"
#import "Engine.h"

@interface Car : NSObject
{
	Engine *engine;
	Tire *tires[4];
}
- (Engine *) engine;
- (void) setEngine: (Engine *) newEngine;
- (Tire *) tireAtIndex: (int) index;
- (void) setTire: (Tire *) tire atIndex: (int) index;
- (void) print;
@end // Car