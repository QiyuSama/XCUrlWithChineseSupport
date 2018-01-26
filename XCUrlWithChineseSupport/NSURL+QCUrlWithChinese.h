//
//  NSURL+QCUrlWithChinese.h
//  QingClassSaas
//
//  Created by xiangchao on 2018/1/25.
//  Copyright © 2018年 QingClass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (QCUrlWithChinese)
+ (NSString *)encodeUrlStringByAddingPercentEscapes:(NSString *)urlString;
@end
