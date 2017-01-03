#import <Cocoa/Cocoa.h>

@interface JsonTool : NSObject
{
	NSString *serverUrl;
}

@property(copy) NSString *serverUrl;

-(id) initWithServerUrl: (NSString*) serverUrl;
-(void) DoGetMethod: (NSString*) url;

-(NSData*) PackageData;
-(void) UnPackageData: (NSData*) jsonData;
-(void) UnPackageDataFromUrl: (NSString *) queryUrl;

@end