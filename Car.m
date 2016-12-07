#import "Car.h"

@implementation Car
{
	NSMutableArray *tires;
	NSString *name;
	Engine *engine;
}

@synthesize name;
@synthesize engine;

- (id) init
{
	if ((self = [super init]))
	{
		self.name = @"Car";
		tires = [[NSMutableArray alloc] init];

		for (int i = 0; i < 4; i++)
		{
			//tires[i] = [Tire new];
			[tires addObject: [NSNull null]];
		}
	}
	
	return (self);
} // init

- (Tire *) tireAtIndex: (int) index
{
	/*
	if (index < 0 || index > 3)
	{
		NSLog(@"bad index (%d) in tireAtIndex:", index);
		exit(1);
	}
	
	return (tires[index]);
	
	*/
	Tire *tire = [tires objectAtIndex: index];
	
	return tire;
} // tireAtIndex

- (void) setTire : (Tire *) tire atIndex: (int) index
{
	/*
	if (index < 0 || index > 3)
	{
		NSLog(@"bad index (%d) in  setTire:atIndex:", index);
		exit(1);
	}
	tires[index] = tire;
	*/
	
	[tires replaceObjectAtIndex: index
	withObject: tire];
	
} // setTire

- (void) print
{
	NSLog(@"%@", engine);
	for (int i = 0; i < 4; i++)
	{
		NSLog(@"%@", tires[i]);
	}
} // print

- (id) copyWithZone: (NSZone *) zone
{
	Car *carCopy;
	carCopy = [[[self class] allocWithZone: zone] init];
	carCopy.name = self.name;
	
	Engine *engineCopy;
	engineCopy = [[engine copy] autorelease];
	carCopy.engine = engineCopy;
	
	for (int i = 0; i < 4; i++)
	{
		Tire *tireCopy;
		tireCopy = [[self tireAtIndex: i] copy];
		[tireCopy autorelease];
		[carCopy setTire: tireCopy atIndex: i];
	}
	
	return carCopy;
}

@end // car