#import <Cocoa/Cocoa.h>

@interface Cattle : NSObject
{
	int legsCount;
	@private
	bool gender;
	@protected
	int eyesCount;
	@public
	NSString* masterName;
}

-(id)initWithLegsCount:(int) theLegsCount 
		gender:(bool) theGender 
		eyesCount:(int) theEyesCount 
		masterName:(NSString*)theMasterName;

-(void)saySomething;
-(void)setLegsCount:(int)count;

@end