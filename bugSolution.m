@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    NSString *tempString = [[NSString alloc] initWithString:@"Hello"];
    self.myString = tempString;
    [tempString release]; // Fixed: Release tempString
}
@end
//Note: This solution is for non-ARC environment. In ARC environment this is not needed.