#import "Bull.h"

@implementation Bull
{
	NSString *skinColor;
}

@synthesize skinColor;

-(void)saySomething
{
	NSLog(@"Hello, i am a %@ bull, and my master is %@", 
	[self skinColor], masterName);
}

@end