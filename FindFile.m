#import "FindFile.h"

void FindFile()
{
	/*
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
	*/
	NSLog(@"Find File.");
	printf("This is C function.\n");
}