#import "MyWorkThread.h"

@implementation MyWorkThread

- (void) DoWork
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSLog(@"I am working...");
	[pool release];
}

- (void) DoWorkWithParam : (id) param
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	int myInt = [param intValue];
	NSLog(@"I am working with %d...", myInt);
	[pool release];
}

@end

void BackGroundWork()
{
	MyWorkThread *workThread = [[MyWorkThread alloc] init];
	[workThread performSelectorInBackground: @selector(DoWork) withObject: nil];
	[workThread performSelectorInBackground: @selector(DoWorkWithParam:) withObject: [NSNumber numberWithInt : 100]];
}