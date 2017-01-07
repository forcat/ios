#import "Car.h"

@implementation Car
{
	NSMutableArray *tires;
	NSString *name;
	Engine *engine;
}

@synthesize name;
//@synthesize engine;

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

- (void) setEngine: (Engine*) newEngine
{
	NSLog(@"in car engine: %d", [engine retainCount]);
	[engine release];
	NSLog(@"in car engine: %d", [engine retainCount]);
	engine = [newEngine retain];
	NSLog(@"in car engine: %d", [engine retainCount]);
}

- (Engine*) engine
{
	return engine;
}

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
	
	[tires replaceObjectAtIndex: index withObject: tire];
	
} // setTire

- (void) print
{
	NSLog(@"%@", self.name);
	
	NSLog(@"%@", engine);
	
	/*
	for (int i = 0; i < 4; i++)
	{
		NSLog(@"%@", [self tireAtIndex: i]);
	}
	*/
	
	for (Tire *tire in tires)
	{
		NSLog(@"%@", tire);
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

- (void) dealloc
{
	self.name = nil;
	[tires release];
	[engine release];
	[super dealloc];
} // dealloc

+ (void) ShowMyCar
{
	// 组装车辆
	Car *car = [[Car alloc] init];
	car.name = @"Cruze";
	
	// 装配引擎
	Slant6 *engine = [[Slant6 alloc] init];
	[car setEngine: engine];
	[engine release];
	
	// 装配轮胎
	for (int i = 0; i < 4; i++)
	{
		Tire *tire = [[Tire alloc] initWithPressure:34 treadDepth: 20];
		[car setTire: tire atIndex: i];
		[tire release];
	}
	[car print];
	
	Car *carCopy = [car copy];
	carCopy.name = @"New Cruze";
	[carCopy print];
	
	[car release];
	[carCopy release];
}

@end // car

void TestRetainCount()
{
	Engine *engine1 = [[Engine alloc] init];
	NSLog(@"%d", [engine1 retainCount]);
	Car *car1 = [[Car alloc] init];
	Car *car2 = [[Car alloc] init];
	[car1 setEngine: engine1];
	NSLog(@"%d", [engine1 retainCount]);
	[engine1 release];
	NSLog(@"%d", [engine1 retainCount]);
	[car2 setEngine: [car1 engine]];
}