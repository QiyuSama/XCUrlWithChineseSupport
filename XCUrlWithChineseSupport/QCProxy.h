//
//  QCProxy.h
//  QingClass
//
//  Created by xiangchao on 2017/7/3.
//  Copyright © 2017年 qingclass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QCProxy : NSProxy
+ (QCProxy *)proxyWithTarget:(id)target;
- (QCProxy *)initWithTarget:(id)target;
@end
