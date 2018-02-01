//
//  QCProxy.m
//  QingClass
//
//  Created by xiangchao on 2017/7/3.
//  Copyright © 2017年 qingclass. All rights reserved.
//

#import "QCProxy.h"

@interface QCProxy ()
@property (nonatomic, weak) id target;
@end

@implementation QCProxy
- (QCProxy *)initWithTarget:(id)target
{
    _target = target;
    return self;
}

+ (QCProxy *)proxyWithTarget:(id)target
{
    return [[self alloc] initWithTarget:target];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    return [_target respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [_target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:_target];
}
@end
