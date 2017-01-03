#import "DoProxy.h"
#import "Cattle.h"
#import "Bull.h"

@implementation DoProxy

-(void) setAllIVars
{
	// NSString* myName = NSStringFromSelector(_cmd);
	// NSLog(@"Running the method of %@", myName);
	// 从字符串转换为方法，类(NSSelectorFromString)
	// 获取方法，类的字符串(NSClassFromString)
	cattle[0] = [Cattle new];
	// NSLog(@"%@", [cattle[0] className]);
	
	bullClass = NSClassFromString(BULL_CLASS);
	//NSLog(@"%@", bullClass);
	
	cattle[1] = [bullClass new];
	cattle[2] = [bullClass new];

	say = @selector(saySomething);
	// NSString *tmp = NSStringFromSelector(say);
	// NSLog(@"%@", tmp);
	
	skin = NSSelectorFromString(SET_SKIN_COLOR);
	// NSString *tmp = NSStringFromSelector(skin);
	// NSLog(@"%@", tmp);
}

-(void) SELFuncs
{
	[self doWithCattleId: cattle[0] colorParam:@"brown"];
	[self doWithCattleId: cattle[1] colorParam:@"red"];
	[self doWithCattleId: cattle[2] colorParam:@"black"];
	[self doWithCattleId: self colorParam: @"haha"];
}

-(void) functionPointers
{
	//NSLog(@"Running as a function pointer will be more efficiency");
	
	setSkinColor_Func = (void (*)(id, SEL, NSString*)) [cattle[1] methodForSelector: skin];
	setSkinColor_Func(cattle[1], skin, @"abc");

	say_Func = [cattle[1] methodForSelector: say];
	say_Func(cattle[1], say);
}

-(void) doWithCattleId: (id) aCattle colorParam: (NSString*) color
{
	if (notFirstRun == NO)
	{
		NSString* myName = NSStringFromSelector(_cmd);
		NSLog(@"Running the method of %@", myName);
		notFirstRun = YES;
	}
	
	NSString* cattleParamClassName = [aCattle className];
	
	if ([cattleParamClassName isEqualToString: BULL_CLASS] || [cattleParamClassName isEqualToString: CATTLE_CLASS])
	{
		[aCattle setLegsCount: 4];
		if ([aCattle respondsToSelector: skin])
		{
			[aCattle performSelector: skin withObject: color];
		}
		else
		{
			NSLog(@"Hi, I am a %@, have not setSkinColor!", cattleParamClassName);
		}
		
		[aCattle performSelector: say];
	}
	else
	{
		NSString* yourClassName = [aCattle className];
		NSLog(@"Hi, You are a %@, but i like cattle or bull!", yourClassName);
	}
}

@end

void TestProxy()
{
	/*
	DoProxy *doProxy = [DoProxy new];
	[doProxy setAllIVars];
	//[doProxy SELFuncs];
	[doProxy functionPointers];
	*/
	Bull *redBull = [[Bull alloc] initWithLegsCount:4 
                                             gender:YES 
                                          eyesCount:2 
                                         masterName:@"that cowboy"];
    [redBull setSkinColor:@"red"];
    
    //legal, but not good
    //redBull->setMasterName = @"that cowgirl";
	
	[redBull saySomething];
}