//file MyClass.h

@class MyOtherClass;
@interface MyClass: NSObject
@property (strong) NSString * myString;
@end

//file MyClass.M
#import "MyOtherClass.h"
#import "MyClass.h"
@implementation MyClass

-copy{
    //create copy
    copy.myString = [self.myString copy];
}
@end



//file MyOtherClass.h

@interface MyOtherClass: MyClass
@property (strong) NSNumber * myNumber;
@end


//file MyOtherClass.M
@implementation MyOtherClass

-copy{
    copy = [super copy];

    copy.myNumber = [self.myNumber copy];
}

@end

