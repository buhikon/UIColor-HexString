//
//  UIColor+UIColor_HexString.m
//
//  Created by Joey Lee on 13. 9. 30.
//  Copyright (c) 2013 Joey Lee. All rights reserved.
//

#import "UIColor+HexString.h"

@implementation UIColor (UIColor_HexString)

// convert HexString to UIColor
+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    UIColor *result = nil;
    
    @try {
        
        int bypassCount = 0;
        int unitSize = 0;
        BOOL alphaExist = NO;
        
        
        NSString *first1Str = [hexString substringToIndex:1];
        if([first1Str isEqualToString:@"#"]) {
            bypassCount = 1;
        }
        NSString *first2Str = [hexString substringToIndex:2];
        if([first2Str isEqualToString:@"0x"]) {
            bypassCount = 2;
        }
        
        
        int colorLength = hexString.length - bypassCount;
        if( colorLength == 3 ) { unitSize = 1; alphaExist = NO;  }
        if( colorLength == 4 ) { unitSize = 1; alphaExist = YES; }
        if( colorLength == 6 ) { unitSize = 2; alphaExist = NO;  }
        if( colorLength == 8 ) { unitSize = 2; alphaExist = YES; }
        
        
        if( unitSize > 0 ) {
            
            NSString *rStr = [hexString substringWithRange:NSMakeRange(bypassCount, unitSize)];
            NSString *gStr = [hexString substringWithRange:NSMakeRange(bypassCount+unitSize, unitSize)];
            NSString *bStr = [hexString substringWithRange:NSMakeRange(bypassCount+unitSize*2, unitSize)];
            NSString *aStr = nil;
            if(alphaExist)
                aStr = [hexString substringWithRange:NSMakeRange(bypassCount+unitSize*3, unitSize)];
            else {
                NSMutableString *temp = [NSMutableString string];
                for(int i=0; i<unitSize; i++)
                    [temp appendString:@"F"];
                aStr = temp;
            }
            
            NSScanner *rScanner = [NSScanner scannerWithString:rStr];
            NSScanner *gScanner = [NSScanner scannerWithString:gStr];
            NSScanner *bScanner = [NSScanner scannerWithString:bStr];
            NSScanner *aScanner = [NSScanner scannerWithString:aStr];
            
            unsigned int rInt, gInt, bInt, aInt, maxInt;
            [rScanner scanHexInt:&rInt];
            [gScanner scanHexInt:&gInt];
            [bScanner scanHexInt:&bInt];
            [aScanner scanHexInt:&aInt];
            maxInt = pow(16, unitSize) - 1;
            
            if(maxInt < rInt) rInt = 0;
            if(maxInt < gInt) gInt = 0;
            if(maxInt < bInt) bInt = 0;
            if(maxInt < aInt) aInt = 0;
            
            
            CGFloat rFloat = (CGFloat)rInt / (CGFloat)maxInt;
            CGFloat gFloat = (CGFloat)gInt / (CGFloat)maxInt;
            CGFloat bFloat = (CGFloat)bInt / (CGFloat)maxInt;
            CGFloat aFloat = (CGFloat)aInt / (CGFloat)maxInt;
            
            result = [UIColor colorWithRed:rFloat green:gFloat blue:bFloat alpha:aFloat];
        }
        
        
    }
    @catch (NSException *exception) { }
    @finally { }
    
    return result;
}


@end
