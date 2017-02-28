//
//  LFCGzipUtillity.h
//  TechownShow
//
//  Created by kuro on 12-8-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "zlib.h"

@interface LFCGzipUtillity : NSObject

+ (NSData *)gzipUnpack:(NSData *)compressedData;
+ (NSData *)uncompressZippedData:(NSData *)compressedData;
@end
