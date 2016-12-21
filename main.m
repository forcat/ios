//
//********SweetTutos***************
//****www.sweettutos.com*******
//
#import <Cocoa/Cocoa.h>
#import "FindFile.h"
#import "FindFileWorker.h"
#import "MyWorkThread.h"
#import "Concurrency.h"
#import "DoProxy.h"

int main (int argc, const char * argv[]) 
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	//@autoreleasepool
	// {	
		NSLog(@"Hello,This is my first IOS EXE !!!");
		printf("This is C style print.\n");
		
		// oc 中的异常处理
		@try
		{
			//TestFindFileDelegete();
			//SerialQueue();
			TestProxy();
		}
		@catch (NSException *e)
		{
			NSLog(@"Exception: %@", e);
		}
		@finally
		{
			NSLog(@"Finally");
		}

		NSLog(@"To be continue, Bye bye !!!");
	// }
    [pool release];
    return 0;
}