#import <Cocoa/Cocoa.h>

#define SET_SKIN_COLOR @"setSkinColor:"
#define BULL_CLASS @"Bull"
#define CATTLE_CLASS @"Cattle"


// 本例程讲解了
// 1，SEL,IMP,Class关键字的用法
// 2，函数指针 

@interface DoProxy : NSObject
{
	BOOL notFirstRun;
	id cattle[3];
	SEL say;
	SEL skin;
	void (*setSkinColor_Func) (id, SEL, NSString*);
	IMP say_Func;
	Class bullClass;
}

- (void) setAllIVars;
- (void) SELFuncs;
- (void) functionPointers;
- (void) doWithCattleId:(id) aCattle colorParam: (NSString*) color;

@end

void TestProxy();