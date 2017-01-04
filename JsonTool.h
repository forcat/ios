#import <Cocoa/Cocoa.h>

@interface JsonTool : NSObject

-(void) DoGetMethod: (NSString*) url;
-(NSData*) PackageData;
-(void) UnPackageData: (NSData*) jsonData;
-(void) UnPackageDataFromUrl: (NSString *) queryUrl;

@end

void TestGetJsonData();