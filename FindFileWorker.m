#import "FindFileWorker.h"

@implementation FindFileWorker
{
	id <FindFileProtocol> delegate;
}

@synthesize delegate;

- (void) DoWork
{
	// 判断委托是否能响应指定的消息（方法）
	/*
	if (YES == [delegate respondsToSelector: @selector(FindFile)])
	{
		[delegate FindFile];
	}
	else
	{
		NSLog(@"The delegate class is not implement 'FindFile' function");
	}
	*/
	
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

void TestFindFileDelegete()
{
	FindFile *delegate = [[FindFile alloc] init];		
	FindFileWorker *worker = [[FindFileWorker alloc] init];
	worker.delegate = delegate;
	[worker DoWork];
}