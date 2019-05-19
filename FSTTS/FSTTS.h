//
//  FSTTS.h
//  FSAccount
//
//  Created by FudonFuchina on 2019/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSTTS : NSObject

// priority为优先级，优先级越大，值越小，从0开始；wait，同优先级的语音，是否等待前一条播完后继续播，不等待则不会播了。
- (void)speech:(NSString *)text priority:(NSInteger)priority wait:(BOOL)wait;

@end

NS_ASSUME_NONNULL_END
