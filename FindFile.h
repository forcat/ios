#import <Foundation/Foundation.h>
#include <stdio.h>

// 本例程解释如何使用协议
// 协议（类似C/C++或java的接口）
@protocol FindFileProtocol <NSObject>

// 必须实现的函数
@required
- (void) FindFile;

// 可选实现的函数
@optional

- (void) OptionFindFile;

@end

// 声明支持某个协议
@interface FindFile : NSObject<FindFileProtocol>
- (void) FindFile;
@end


void GlobalFindFile(NSString *fileExtern);