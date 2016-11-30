//
//********SweetTutos***************
//****www.sweettutos.com*******
//
#import <Foundation/Foundation.h>
#import "Car.h"
#import "Slant6.h"
#import "Tire.h"


int main (int argc, const char * argv[]) 
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSFileManager *manager = [NSFileManager defaultManager];
	NSString *home = [@"~" stringByExpandingTildeInPath];
	NSMutableArray *files;
	files = [NSMutableArray arrayWithCapacity: 42];
	
	for (NSString *fileName in [manager enumeratorAtPath: home])
	{
		if ([[fileName pathExtension] isEqualTo: @"jpg"])
		{
			[files addObject: fileName];
		}
	}
	
	for (NSString *fileName in files)
	{
		NSLog(fileName);
	}
	
	//NSLog(home);

	/*
	NSLog(@"Hello,This is my first IOS EXE !!!");
	
	Car *car = [Car new];
	Slant6 *engine = [Slant6 new];
	[car setEngine: engine];
	
	for (int i = 0; i < 4; i++)
	{
		Tire *tire = [Tire new];
		[car setTire: tire atIndex: i];
	}
	
	[car print];
	*/

    [pool release];
    return 0;
}