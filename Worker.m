#import "Worker.h"

@implementation Worker
{
	id <FindFileProtocol> delegate;
}

@synthesize delegate;

- (void) DoFindFileWork
{
	// 为什么使用 self.delegate 会导致 delegate 引用计数增加？？？
	NSLog(@"delegate retain count:%d", delegate.retainCount);
	
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