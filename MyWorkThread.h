#import <Cocoa/Cocoa.h>
#import "stdio.h"

@interface MyWorkThread : NSObject

- (void) DoWork;

- (void) DoWorkWithParam : (id) param;

@end

// 后台线程调用方法
void BackGroundWork();