//
//  NSURL+QCUrlWithChinese.m
//  QingClassSaas
//
//  Created by xiangchao on 2018/1/25.
//  Copyright © 2018年 QingClass. All rights reserved.
//

#import "NSURL+QCUrlWithChinese.h"
#import <objc/runtime.h>

@implementation NSURL (QCUrlWithChinese)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method origionMethod = class_getClassMethod(self, @selector(URLWithString:));
        Method newMethod = class_getClassMethod(self, @selector(qc_URLWithString:));
        method_exchangeImplementations(origionMethod, newMethod);
        
        Method origionFileURLMethod = class_getClassMethod(self, @selector(fileURLWithPath:));
        Method newFileURLMethod = class_getClassMethod(self, @selector(qc_fileURLWithPath:));
        method_exchangeImplementations(origionFileURLMethod, newFileURLMethod);
    });
}

+ (NSURL *)qc_URLWithString:(NSString *)url {
    NSString *encodedString = [self encodeUrlStringByAddingPercentEscapes:url];
    return [self qc_URLWithString:encodedString];
}

+ (NSURL *)qc_fileURLWithPath:(NSString *)path {
    NSString *encodedString = [self encodeUrlStringByAddingPercentEscapes:path];
    return [self qc_fileURLWithPath:encodedString];
}

+ (NSString *)encodeUrlStringByAddingPercentEscapes:(NSString *)urlString {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (CFStringRef)urlString,
                                                                                 (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                                 NULL,
                                                                                 kCFStringEncodingUTF8));
}
@end
