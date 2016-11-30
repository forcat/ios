#import "Car.h"

@implementation Car
- (id) init
{
	if (self = [super init])
	{
		engine = [Engine new];
		for (int i = 0; i < 4; i++)
		{
			tires[i] = [Tire new];
		}
	}
	
	return (self);
} // init

- (Engine *) engine
{
	return (engine);
} // engine

- (void) setEngine: (Engine *) newEngine
{
	engine = newEngine;
} // setEngine

- (Tire *) tireAtIndex: (int) index
{
	if (index < 0 || index > 3)
	{
		NSLog(@"bad index (%d) in tireAtIndex:", index);
		exit(1);
	}
	
	return (tires[index]);
} // tireAtIndex

- (void) setTire : (Tire *) tire atIndex: (int) index
{
	if (index < 0 || index > 3)
	{
		NSLog(@"bad index (%d) in  setTire:atIndex:", index);
		exit(1);
	}
	tires[index] = tire;
} // setTire

- (void) print
{
	NSLog(@"%@", engine);
	for (int i = 0; i < 4; i++)
	{
		NSLog(@"%@", tires[i]);
	}
} // print

@end // car