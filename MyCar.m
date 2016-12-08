#import <MyCar.h>
#import "Car.h"
#import "Slant6.h"
#import "Tire.h"

@implementation MyCar

+ (void) ShowMyCar
{
	// 组装车辆
	Car *car = [[Car alloc] init];
	car.name = @"Cruze";
	
	// 装配引擎
	Slant6 *engine = [[Slant6 alloc] init];
	[car setEngine: engine];
	[engine release];
	
	// 装配轮胎
	for (int i = 0; i < 4; i++)
	{
		Tire *tire = [[Tire alloc] initWithPressure:34 treadDepth: 20];
		[car setTire: tire atIndex: i];
		[tire release];
	}
	[car print];
	
	Car *carCopy = [car copy];
	carCopy.name = @"New Cruze";
	[carCopy print];
	
	[car release];
	[carCopy release];
}

@end