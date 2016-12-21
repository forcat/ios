#import <Cocoa/Cocoa.h>
#import "FindFile.h"

// 本例程解释如何使用委托

@interface FindFileWorker : NSObject
{
	// 声明一个委托
	// 使用<FindFileProtocol>是为了编译时发现问题
	id <FindFileProtocol> delegate;
}

@property (retain) id <FindFileProtocol> delegate;

- (void) DoWork;

@end // Worker


void TestFindFileDelegete();