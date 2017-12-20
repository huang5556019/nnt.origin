#import "CommonObj.h"
#import "NetObj.h"

//for output

//默认输出
@interface UserSetdevicetoken : NSObject<NetObj>
{
    NSMutableSet* __inputSet__;
    NSMutableDictionary* __inputFiles__;
}
//input fields
//客户端设备号 
@property(nonatomic, retain) NSString* in_devicetoken;


//output fields
//返回码  0：成功 
@property(nonatomic, assign) int code;
//返回结果描述 
@property(nonatomic, retain) NSString* message;


- (void)parse:(NSObject*)obj;
- (void)addFile:(NSString*)path forKey:(NSString*)key;

@end;

