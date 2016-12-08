#import "Worker.h"

@implementation Worker
{
	id <FindFileProtocol> delegate;
}

@synthesize delegate;

- (void) DoFindFileWork
{
	NSLog(@"call FindFile");
	[delegate FindFile];

	NSLog(@"call OptionFindFile");
	if (YES == [delegate respondsToSelector: @selector(OptionFindFile)])
	{
		[delegate OptionFindFile];
	}
	else
	{
		NSLog(@"The delegate class is not implement 'OptionFindFile' function");
	}
}

@end