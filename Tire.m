#import "Tire.h"

@implementation Tire
{
	float pressure;
	float treadDepth;
}

@synthesize pressure;
@synthesize treadDepth;

- (NSString *) description
{
	return (@"I am a tire, I last a while.");
} // description

- (id) initWithPressure: (float) p treadDepth: (float) t
{
	if ((self = [super init]))
	{
		pressure = p;
		treadDepth = t;
	}
	
	return self;
} // initWithPressure:treadDepth

- (id) copyWithZone: (NSZone *) zone
{
	Tire *tireCopy;
	tireCopy = [[[self class] allocWithZone: zone] 
	initWithPressure: pressure 
	treadDepth: treadDepth];
	return tireCopy;
} // copyWithZone

@end