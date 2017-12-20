#import "CommonObj.h"
#import "NetObj.h"

//for output

//默认输出
@interface ForwardTransferlog : NSObject<NetObj>
{
    NSMutableSet* __inputSet__;
    NSMutableDictionary* __inputFiles__;
}
//input fields
//"WEIBO","QQ" 
@property(nonatomic, retain) NSString* in_platformlist;
// 
@property(nonatomic, retain) NSString* in_resid;


//output fields
//返回码  0：成功 
@property(nonatomic, assign) int code;
//返回结果描述 
@property(nonatomic, retain) NSString* message;


- (void)parse:(NSObject*)obj;
- (void)addFile:(NSString*)path forKey:(NSString*)key;

@end;

