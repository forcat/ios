//
//********SweetTutos***************
//****www.sweettutos.com*******
//
#import <Foundation/Foundation.h>
#import "FindFile.h"
#import "MyCar.h"
#import "Worker.h"

int main (int argc, const char * argv[]) 
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	//@autoreleasepool
	{	
		NSLog(@"Hello,This is my first IOS EXE !!!");

		// GlobalFindFile();
		// [MyCar ShowMyCar];
		FindFileDelegate *delegate = [[FindFileDelegate alloc] init];
		Worker *worker = [[Worker alloc] init];
		
		// [worker setDelegate: delegate];
		worker.delegate = delegate;
		
		[worker DoFindFileWork];
		
		NSLog(@"To be continue, Bye bye !!!");
	}
    [pool release];
    return 0;
}