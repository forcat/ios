#import <Cocoa/Cocoa.h>

@interface MyQueue : NSObject
- (NSOperation *) operationWithData : (id)data;
- (void) myWorkerMethod: (id)data;
@end

// 并发编程

// 队列任务
// 注：队列任务的函数模型必须符合这个格式
void QueueTask(void *argument);


// 三种队列：
// 1，连续队列
void SerialQueue();
// 清理队列上下文
void CleanSerialQueue(void *context);

// 2，并发队列
void AsyncQueue();

// 3，主队列
void MainQueue();

