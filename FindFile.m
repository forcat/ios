#import "FindFile.h"

@implementation FindFile

- (void) FindFile
{
	GlobalFindFile(@"jpg");
}

@end

void GlobalFindFile(NSString *fileExtern)
{
	NSLog(@"Find file with extension: %@", fileExtern);	
	NSFileManager *manager = [NSFileManager defaultManager];
	NSString *home = [@"~" stringByExpandingTildeInPath];
	NSMutableArray *files;
	files = [NSMutableArray arrayWithCapacity: 42];
	
	for (NSString *fileName in [manager enumeratorAtPath: home])
	{
		if ([[fileName pathExtension] isEqualTo: fileExtern])
		{
			[files addObject: fileName];
		}
	}
	
	for (NSString *fileName in files)
	{
		NSLog(fileName);
	}
}