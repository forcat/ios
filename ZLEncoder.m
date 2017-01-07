#import "ZLEncoder.h"

@implementation ZLEncoder
@synthesize name;
@synthesize magicNumber;
@synthesize shoeSize;
@synthesize subThingies;

-(id) initWithName: (NSString*) n magicNumber:(int) mn shoeSize:(float)ss
{
	if ((self = [super init]))
	{
		self.name = n;
		self.magicNumber = mn;
		self.shoeSize = ss;
		self.subThingies = [NSMutableArray array];
	}
	
	return self;
}

-(void) dealloc
{
	[name release];
	[subThingies release];
	[super dealloc];
}

-(void) encodeWithCoder: (NSCoder*)coder
{
	[coder encodeObject: name forKey: @"name"];
	[coder encodeInt: magicNumber forKey: @"magicNumber"];
	[coder encodeFloat: shoeSize forKey: @"shoeSize"];
	[coder encodeObject: subThingies forKey: @"subThingies"];
}

-(id) initWithCoder: (NSCoder*) decoder
{
	if ((self = [super init]))
	{
		self.name = [decoder decodeObjectForKey: @"name"];
		self.magicNumber = [decoder decodeIntForKey: @"magicNumber"];
		self.shoeSize = [decoder decodeFloatForKey: @"shoeSize"];
		self.subThingies = [decoder decodeObjectForKey: @"subThingies"];
	}
	
	return self;
}

- (NSString *) description
{
	NSString *description = 
	[NSString stringWithFormat: @"%@: %d/%.1f %@",
	name, magicNumber, shoeSize, subThingies];
	
	return (description);
}

@end

void TestEncoder()
{
	NSString *file = @"d:/encode.txt";
	
	ZLEncoder *thing1;
	thing1 = [[ZLEncoder alloc] initWithName: @"ZS" magicNumber: 42 shoeSize: 10.5];
	NSLog(@"%@", thing1);
	
	NSData *data;
	// 归档or序列化
	data = [NSKeyedArchiver archivedDataWithRootObject: thing1];
	
	[data writeToFile: file atomically: YES];
	
	// 取档or反序列化
	data = [NSData dataWithContentsOfFile: file];
	thing1 = [NSKeyedUnarchiver unarchiveObjectWithData: data];
	NSLog(@"%@", thing1);
}