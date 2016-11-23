//
//  ParseJSON.h
//  JSONapp
//
//  Created by Тарас on 23.11.16.
//  Copyright © 2016 Taras Minin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ParseJSON : NSObject <NSURLConnectionDataDelegate>

+ (NSData *)downloadJSONfromURL:(NSURL *)url;

+ (NSDictionary *)convertJSONData:(NSData*)data;

@end
