#import "Cattle.h"

@implementation Cattle

-(id)init
{
	[super init];
	return [self initWithLegsCount: 4
			gender: YES
			eyesCount: 2
			masterName: @"ZhangSan"];
}

-(id)initWithLegsCount:(int) theLegsCount 
		gender:(bool) theGender 
		eyesCount:(int) theEyesCount 
		masterName:(NSString*)theMasterName
{
	
	legsCount = theLegsCount;
	gender = theGender;
	eyesCount = theEyesCount;
	masterName = theMasterName;

	return self;
}

-(void)saySomething
{
	NSLog(@"Hello, i am a cattle, i have %d legs", legsCount);
}

-(void)setLegsCount:(int)count
{
	legsCount = count;
}

@end
