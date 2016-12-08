#import "FindFile.h"

void GlobalFindFile()
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
	// sscanf();
	printf("This is C function: \"printf\".\n");
}

@implementation FindFileDelegate

- (void) FindFile
{
	GlobalFindFile();
}

@end