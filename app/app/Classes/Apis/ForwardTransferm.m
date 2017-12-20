#import "ForwardTransferm.h"
#import "Const.h"

#if __has_feature(objc_arc)
# define ARC_MODE
# define SAFE_RELEASE(obj) {}
# define SAFE_RETAIN(obj) obj
#else
# define SAFE_RELEASE(obj) [obj release]
# define SAFE_RETAIN(obj) [obj retain]
#endif

//output auto generated anonymous structs
@implementation ForwardTransfermData
@synthesize messages;


- (id)init {
    self = [super init];
    if (self) {
        messages = [[NSMutableArray alloc] init];

    }
    return self;
}

- (void)dealloc {
#ifndef ARC_MODE
    SAFE_RELEASE(messages);

    [super dealloc];
#endif
}

- (void)parse:(NSObject*)obj {
	if (obj && [obj isKindOfClass:[NSDictionary class]]) {
	    NSDictionary* dict = (NSDictionary*)obj;

	    NSObject* array_messages = [dict objectForKey:@"messages"];
	    [messages removeAllObjects];
	    if (array_messages && [array_messages isKindOfClass:[NSArray class]]) {
	        NSArray *array = (NSArray*)array_messages;
	        for (int i = 0; i < [array count]; i++) {
	            NSObject* obj = [array objectAtIndex:i];
	            if (obj && [obj isKindOfClass:[NSDictionary class]]) {
	                Message* tmp = [[Message alloc] init];
	                [tmp parse:obj]; 
	                [messages addObject:tmp];
	                SAFE_RELEASE(tmp);
	            }    
	        
	        }
	    }
	}
}
@end;



//for output

@implementation ForwardTransferm
//input fields
@synthesize in_title;
@synthesize in_summary;
@synthesize in_avatar;
@synthesize in_image;
@synthesize in_resid;
@synthesize in_thread;
@synthesize in_message;


//output fields
@synthesize code;
@synthesize message;
@synthesize data;


- (id)init {
    self = [super init];
    if (self) {
        in_title = @"";
        in_summary = @"";
        in_avatar = @"";
        in_image = @"";
        in_resid = @"";
        in_thread = @"";
        in_message = @"";

        __inputSet__ = [[NSMutableSet alloc] init];
        code = 0;
        message = @"";
        data = [[ForwardTransfermData alloc] init];

    }
    return self;
}

- (void)dealloc {
#ifndef ARC_MODE
    SAFE_RELEASE(in_title);
    SAFE_RELEASE(in_summary);
    SAFE_RELEASE(in_avatar);
    SAFE_RELEASE(in_image);
    SAFE_RELEASE(in_resid);
    SAFE_RELEASE(in_thread);
    SAFE_RELEASE(in_message);

    [__inputSet__ release];
    if (__inputFiles__ != nil)
        [__inputFiles__ release];
    SAFE_RELEASE(message);
    SAFE_RELEASE(data);

    [super dealloc];
#endif
}

-(void)initRequest:(ASIFormDataRequest *)request {
    [request setUserInfo:[NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:self, API_FORWARD_TRANSFERM, nil]
        forKeys:[NSArray arrayWithObjects:@"class", @"api", nil]]];

    if ([__inputSet__ containsObject:@"title"])
    	[request setPostValue:in_title forKey:@"title"];
    if ([__inputSet__ containsObject:@"summary"])
    	[request setPostValue:in_summary forKey:@"summary"];
    if ([__inputSet__ containsObject:@"avatar"])
    	[request setPostValue:in_avatar forKey:@"avatar"];
    if ([__inputSet__ containsObject:@"image"])
    	[request setPostValue:in_image forKey:@"image"];
    if ([__inputSet__ containsObject:@"resid"])
    	[request setPostValue:in_resid forKey:@"resid"];
    if ([__inputSet__ containsObject:@"thread"])
    	[request setPostValue:in_thread forKey:@"thread"];
    if ([__inputSet__ containsObject:@"message"])
    	[request setPostValue:in_message forKey:@"message"];
    
    if (__inputFiles__ != nil) {
        for (id key in [__inputFiles__ allKeys]) {
            [request setFile:[__inputFiles__ objectForKey:key] forKey:key];
        }
    }
}

-(void)addFile:(NSString*)path forKey:(NSString*)key {
    if (__inputFiles__ == nil)
        __inputFiles__ = [[NSMutableDictionary alloc] init];
    [__inputFiles__ setObject:path forKey:key];    
}

-(NSString*)getUrl {
    return API_FORWARD_TRANSFERM;
}

-(void)setIn_title:(NSString*)_title {
    if (in_title)
        SAFE_RELEASE(in_title);
    in_title = SAFE_RETAIN(_title);
    [__inputSet__ addObject:@"title"];
}-(void)setIn_summary:(NSString*)_summary {
    if (in_summary)
        SAFE_RELEASE(in_summary);
    in_summary = SAFE_RETAIN(_summary);
    [__inputSet__ addObject:@"summary"];
}-(void)setIn_avatar:(NSString*)_avatar {
    if (in_avatar)
        SAFE_RELEASE(in_avatar);
    in_avatar = SAFE_RETAIN(_avatar);
    [__inputSet__ addObject:@"avatar"];
}-(void)setIn_image:(NSString*)_image {
    if (in_image)
        SAFE_RELEASE(in_image);
    in_image = SAFE_RETAIN(_image);
    [__inputSet__ addObject:@"image"];
}-(void)setIn_resid:(NSString*)_resid {
    if (in_resid)
        SAFE_RELEASE(in_resid);
    in_resid = SAFE_RETAIN(_resid);
    [__inputSet__ addObject:@"resid"];
}-(void)setIn_thread:(NSString*)_thread {
    if (in_thread)
        SAFE_RELEASE(in_thread);
    in_thread = SAFE_RETAIN(_thread);
    [__inputSet__ addObject:@"thread"];
}-(void)setIn_message:(NSString*)_message {
    if (in_message)
        SAFE_RELEASE(in_message);
    in_message = SAFE_RETAIN(_message);
    [__inputSet__ addObject:@"message"];
}

- (void)parse:(NSObject*)obj {
	if (obj && [obj isKindOfClass:[NSDictionary class]]) {
	    NSDictionary* dict = (NSDictionary*)obj;

	    self.code = [dict intValue:@"code"];
	    self.message = [dict strValue:@"message"];

	    [data parse:[dict objectForKey:@"data"]];

	}
}
@end;

