#import <Cocoa/Cocoa.h>

@interface MyWorkThread : NSObject

- (void) DoWork;

- (void) DoWorkWithParam : (id) param;

@end