//
//  NSString+External.m
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import "NSString+External.h"

@implementation NSString (External)

+(NSString*)getFilePathFomName:(NSString *)name
{
    NSString * path=[[NSBundle mainBundle]resourcePath];
    NSString * filePath=[path  stringByAppendingFormat:@"/%@.png",name];
    return filePath;
}
@end
