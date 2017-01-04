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
#import "JsonTool.h"

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
			//TestProxy();
			TestGetJsonData();
		}
		@catch (NSException *e)
		{
			NSLog(@"Exception: %@", e);
		}
		@finally
		{
			NSLog(@"try catch Finally");
		}

		NSLog(@"Press any key to continue...");
		getchar();
	// }
    [pool release];
    return 0;
}