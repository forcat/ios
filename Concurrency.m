#import "Concurrency.h"

@implementation MyQueue
- (NSOperation *) operationWithData: (id) data
{
	return [[NSInvocationOperation alloc] initWithTarget: self 
	selector: @selector(myWorkerMethod:) object:data];
}

- (void) myWorkerMethod: (id) data
{
	NSLog(@"I am going to sleep 5 sec...");
	[NSThread sleepForTimeInterval: 5];
	NSLog(@"I am wake up.");
	NSLog(@"My operation data: %@", data);
}

@end

void QueueTask(void *argument)
{
	/*
	NSString *theArgument = (__bridge NSString *)argument;
	NSLog(@"argument is %@", theArgument);
	
	// 在代码块或者函数里获取队列上下文
	NSMutableDictionary *myContext = (__bridge NSMutableDictionary*)dispatch_get_context(dispatch_get_current_queue());
	
	NSString *user = [myContext objectForKey: theArgument];
	NSLog(@"Hello: %@", user);
	*/
}

void SerialQueue()
{
	/*
	// 低级操作
	// 创建连续队列
	dispatch_queue_t my_serial_queue;
	my_serial_queue = dispatch_queue_create("com.liang.myqueue", NULL);
	
	// 设置上下文
	NSMutableDictionary *myContext = [[NSMutableDictionary alloc] initWithCapacity: 5];
	[myContext setObject: @"zhangsan" forKey: @"qs"];
	[myContext setObject: @"lisi" forKey: @"dk"];
	dispatch_set_context(my_serial_queue, (__bridge_retained void*)myContext);
	
	// 设置清理函数
	dispatch_set_finalizer_t(myqueue, (dispatch_function_t)CleanSerialQueue);
	
	// 添加任务
	// 1，同步方式
	dispatch_sync_f(my_serial_queue, (__bridge void*)@"qs", (dispatch_function_t)QueueTask);
	*/
	
	// 高级操作
	// 创建连续队列
	NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	
	// 创建任务
	NSOperation *operation = [[[MyQueue alloc] init] operationWithData: @"This is my operation."];
	
	// 添加任务到队列
	[queue addOperation: operation];
	
	// 等待所有操作完成
	[queue waitUntilAllOperationsAreFinished];
}

void CleanSerialQueue(void *context)
{
	/*
	NSLog(@"Ready to clear up SerialQueue");
	NSMutableDictionary *theData = (__bridge_transfer NSMutableDictionary*)context;
	[theData removeAllObjects];
	*/
}

void AsyncQueue()
{
}

void MainQueue()
{
}