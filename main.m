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
			JsonTool *jsonTool = [JsonTool alloc];
			NSString *queryUrl = @"http://www.weather.com.cn/data/sk/101010100.html";
			
			[jsonTool performSelectorInBackground: @selector(UnPackageDataFromUrl) withObject: queryUrl];
			//[jsonTool UnPackageDataFromUrl: queryUrl];
			/*
			NSData *jsonData = [jsonTool PackageData];
			if (jsonData != nil)
			{
				NSString *json = [[NSString alloc] 
				initWithData: jsonData
				encoding: NSUTF8StringEncoding];
		
				NSLog(@"json data: %@", json);
				
				[jsonTool UnPackageData: jsonData];
			}
			*/
		}
		@catch (NSException *e)
		{
			NSLog(@"Exception: %@", e);
		}
		@finally
		{
			NSLog(@"try catch Finally");
		}

		NSLog(@"To be continue, Bye bye !!!");
	// }
    [pool release];
    return 0;
}