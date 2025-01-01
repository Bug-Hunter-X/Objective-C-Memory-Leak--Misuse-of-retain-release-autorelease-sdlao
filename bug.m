In Objective-C, a common yet subtle error involves the misuse of `retain`, `release`, and `autorelease`.  Incorrectly managing memory can lead to crashes or memory leaks. For example, consider this code:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    NSString *tempString = [[NSString alloc] initWithString:@"Hello"];
    self.myString = tempString;
    // Forgot to release tempString!  It's now leaked.
}
@end
```

This code leaks memory because `tempString` is allocated but never released. Even though it's assigned to `self.myString`, the `strong` property retains the string, but `tempString` remains in memory.