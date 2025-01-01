# Objective-C Memory Management Bug

This repository demonstrates a common memory management bug in Objective-C.  Incorrect use of retain, release, and autorelease can lead to memory leaks.  The `bug.m` file shows the problematic code, while `bugSolution.m` provides a corrected version.

## Bug Description
The `someMethod` function allocates a string using `[[NSString alloc] initWithString:@"Hello"]`, but fails to release it. The assignment to `self.myString` does not resolve the problem. A `strong` property retains it, which is correct. However, the local variable still exists and holds a strong reference, causing the memory leak.

## How to Reproduce
Compile and run the `bug.m` file. While it might not crash immediately, memory leaks can accumulate, eventually degrading application performance and leading to instability.  Use Instruments (Memory management tool from XCode) to detect the memory leak.

## Solution
The `bugSolution.m` file demonstrates how to fix the memory leak.  The string is released using `[tempString release]` before `tempString` goes out of scope. This correctly removes the extraneous strong reference, allowing the memory to be reclaimed when no longer needed.

## Additional Notes
Modern Objective-C (using ARC) simplifies memory management, minimizing this type of error. However, understanding the principles behind `retain`, `release`, and `autorelease` is crucial even within an ARC environment for debugging and working with legacy code.