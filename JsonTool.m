#import "JsonTool.h"

@implementation JsonTool

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
	NSLog(queryUrl);
	NSError *error = nil;

	NSURLRequest *request = [NSURLRequest
	requestWithURL: [NSURL URLWithString: queryUrl]];
	NSLog(@"Ready to connect %@", [request URL]);
	
	NSURLResponse *urlResponse = nil;
	
	NSData *response = [NSURLConnection
	sendSynchronousRequest: request
	returningResponse: &urlResponse
	error: &error];
	
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
}

@end

void TestGetJsonData()
{
	JsonTool *jsonTool = [[JsonTool alloc] init];
	
	// 打包，解包json格式数据
	NSData *jsonData = [jsonTool PackageData];
	if (jsonData != nil)
	{
		NSString *json = [[NSString alloc] 
		initWithData: jsonData
		encoding: NSUTF8StringEncoding];
	
		NSLog(@"json data: %@", json);
			
		[jsonTool UnPackageData: jsonData];
	}
	
	// 从URL获取json格式数据
	/*
	NSString *queryUrl = @"http://www.weather.com.cn/data/sk/101010100.html";
	[jsonTool UnPackageDataFromUrl: queryUrl];
	*/
}