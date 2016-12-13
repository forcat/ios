//
//********SweetTutos***************
//****www.sweettutos.com*******
//
#import <Cocoa/Cocoa.h>
#import "FindFile.h"
#import "MyCar.h"
#import "Worker.h"

typedef int (^IntBlock)();

int main (int argc, const char * argv[]) 
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	//@autoreleasepool
	// {	
		NSLog(@"Hello,This is my first IOS EXE !!!");

		// GlobalFindFile();
		// [MyCar ShowMyCar];
/* 		FindFileDelegate *delegate = [[FindFileDelegate alloc] init];		
		Worker *worker = [[Worker alloc] init];

		// [worker setDelegate: delegate];
		worker.delegate = delegate;
		[worker DoFindFileWork]; */
		void (^myBlock)() = ^(){ NSLog(@"This is my blocks.");};
		
		for (int i = 0; i < 4; i++)
		{
			NSLog(@"%d", i);
		}
		
		@try
		{
			NSLog(@"To be continue, Bye bye !!!");
		}
		@catch (NSException * e)
		{
			NSLog(@"Exception: %@", e);
		}
		@finally
		{
			NSLog(@"finally");
		}
		
	// }
    [pool release];
    return 0;
}