#import "JsonTool.h"

@implementation JsonTool
{
	NSString *serverUrl;
}

@synthesize serverUrl;


-(id) initWithServerUrl: (NSString*) serverUrl
{
	if((self = [super init]))
	{
		self.serverUrl = serverUrl;
	}
	
	return self;
}


-(void) DoGetMethod: (NSString*) url
{
	/*
	// 构建网络URL对象
	NSString *url = [NSString stringWithFromat: @"%@?query=%@", serverUrl, url];
	
	NSString* newUrlSrv = [url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	NSURL *theUrl = [NSURL URLWithString: newUrlSrv];
	
	// 创建网络请求
	NSURLRequest *request = [NSURLRequest requestWithURL: theUrl 
	cachePolicy: NSURLRequestReeloadIgnoringLocalCacheeDatatimeoutInterval: 10];
	
	// 创建同步请求
	NSURLResponse *response = nil;
	NSError *error = nil;
	NSData *data = [NSURLConnection sendSynchronousRequest: request
	returningResponse: &response
	error: &error];
	*/
}

-(NSData*) PackageData
{
	NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value1",@"key1",
	@"value2", @"key2",nil];
	
	if([NSJSONSerialization isValidJSONObject: dic])
	{
		NSError *error;
		NSData *jsonData = [NSJSONSerialization dataWithJSONObject: dic
		options: NSJSONWritingPrettyPrinted
		error: &error];

		return jsonData;
	}
	
	return nil;
}

-(void) UnPackageData: (NSData*) jsonData
{
	NSError *error;
	NSDictionary *dic = [NSJSONSerialization JSONObjectWithData: jsonData
	options: NSJSONReadingMutableLeaves
	error: &error];

	NSArray *keys = [dic allKeys];
	int count = [keys count];
	id key, value;

	for (int i = 0; i < count; i++)
	{
		key = [keys objectAtIndex: i];
		value = [dic objectForKey: key];
		NSLog(@"The %d item: %@-%@", i, key, value);
	}

	/*
	for (NSString *key in dic)
	{
		id value = dic[key];
		NSLog(@"The %d item: %@-%@", key, value);
	}
	*/
}

-(void) UnPackageDataFromUrl: (NSString *) queryUrl
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSLog(queryUrl);
	NSError *error;

	NSURLRequest *request = [NSURLRequest
	requestWithURL: [NSURL URLWithString: queryUrl]];
	
	NSLog(@"a");
	
	NSData *response = [NSURLConnection
	sendSynchronousRequest: request
	returningResponse: nil
	error: nil];
	
	NSLog(@"b");
	
	NSDictionary *weatherInfo = [NSJSONSerialization JSONObjectWithData: response
	options: NSJSONReadingMutableLeaves
	error: &error];
	
	NSLog(@"c");
	
	NSDictionary *weather = [weatherInfo objectForKey: @"weatherinfo"];
	
	NSArray *keys = [weather allKeys];
	int count = [keys count];
	id key, value;

	for (int i = 0; i < count; i++)
	{
		key = [keys objectAtIndex: i];
		value = [weather objectForKey: key];
		NSLog(@"The %d item: %@-%@", i, key, value);
	}
	
	[pool release];
}

@end