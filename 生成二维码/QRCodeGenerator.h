//
//  QRCodeGenerator.h
//  QrcodeDemo
//
//  Created by Jason on 15/4/7.
//  Copyright (c) 2015年 ___KKEYE___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QRCodeGenerator : NSObject
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)size;
+ (UIImage *) twoDimensionCodeImage:(UIImage *)twoDimensionCode withAvatarImage:(UIImage *)avatarImage;

@end
