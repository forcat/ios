#import "Slant6.h"

@implementation Slant6
- (NSString *) description
{
	return @"I am a slant-6. VROOM !";
}

- (id) copyWithZone: (NSZone*) zone
{
	Slant6 *slant6Copy = [super copyWithZone: zone];
	return slant6Copy;
}

@end // Slant6