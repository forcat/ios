#import "DoProxy.h"

@implementation DoProxy

-(void) setAllIVars
{
	cattle[0] = [Cattle new];
	bullClass = NSClassFromString(BULL_CLASS);
	
	cattle[1] = [bullClass new];
	cattle[2] = [bullClass new];
	
	say = @selector(saySomething);
	skin = NSSelectorFromString(SET_SKIN_COLOR);
}

-(void) SELFuncs
{
	[self doWithCattelId: cattle[0] colorParams:@"brown"];
	[self doWithCattelId: cattle[1] colorParams:@"red"];
	[self doWithCattelId: cattle[2] colorParams:@"black"];
	[self doWithCattelId: self colorParams: @"haha"];
}

-(void) functionPointers
{
	setSkinColor_Func = (void *)(id, SEL, NSString*)) [cattle[1] methodForSelector: skin];
	
	say_Func = [cattle[1] methodForSelector: say];
	setSkinColor_Func(cattle[1], skin, @"verbose");
	
	NSLog(@"Running as a function pointer will be more efficiency");
	say_Func(cattle[1], say);
}

-(void) doWithCattelId: (id) aCattle colorParams: (NSString*) colorParams
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
			[aCattle performSelector: skin withOjbect: color];
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
	
}