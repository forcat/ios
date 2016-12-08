#import <Foundation/Foundation.h>
#include <stdio.h>

void GlobalFindFile();

@protocol FindFileProtocol <NSObject>

@required
- (void) FindFile;

@optional

- (void) OptionFindFile;

@end

@interface FindFileDelegate : NSObject<FindFileProtocol>

- (void) FindFile;

@end

