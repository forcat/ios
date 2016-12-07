//
//********SweetTutos***************
//****www.sweettutos.com*******
//
#import <Foundation/Foundation.h>
#import "FindFile.h"
#import "Car.h"
#import "Slant6.h"
#import "Tire.h"


int main (int argc, const char * argv[]) 
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSLog(@"Hello,This is my first IOS EXE !!!");

	FindFile();
	
	/*
	Car *car = [[Car alloc] init];
	Slant6 *engine = [[Slant6 alloc] init];
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