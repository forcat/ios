//
//********SweetTutos***************
//****www.sweettutos.com*******
//
#import <Cocoa/Cocoa.h>
#import "FindFile.h"
#import "MyCar.h"
#import "Worker.h"
#import "MyWorkThread.h"

int main (int argc, const char * argv[]) 
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	//@autoreleasepool
	// {	
		NSLog(@"Hello,This is my first IOS EXE !!!");

		// GlobalFindFile();
		// [MyCar ShowMyCar];
		/* 
		FindFileDelegate *delegate = [[FindFileDelegate alloc] init];		
		Worker *worker = [[Worker alloc] init];
		// [worker setDelegate: delegate];
		worker.delegate = delegate;
		[worker DoFindFileWork]; */
		
		// gcc 不支持代码块语法，必须加入libobjc2，版本1.7以上才支持
		// void (^myBlock)() = ^(){ NSLog(@"This is my blocks.");};

		/* 同步对象
		NSObject *theObj = [[NSObject alloc] init];
		
		@synchronized(theObj)
		{
			NSLog(@"I am in synchronized code.");
		}
		*/
		
		// oc 中的异常处理
		@try
		{
			MyWorkThread *workThread = [[MyWorkThread alloc] init];
			[workThread performSelectorInBackground: @selector(DoWork) withObject: nil];
			[workThread performSelectorInBackground: @selector(DoWorkWithParam:) withObject: [NSNumber numberWithInt : 100]];
		}
		@catch (NSException * e)
		{
			NSLog(@"Exception: %@", e);
		}
		@finally
		{
			NSLog(@"finally");
		}
		
		NSLog(@"To be continue, Bye bye !!!");
	// }
    [pool release];
    return 0;
}