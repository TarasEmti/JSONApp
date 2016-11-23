//
//  ParseJSON.m
//  JSONapp
//
//  Created by Тарас on 23.11.16.
//  Copyright © 2016 Taras Minin. All rights reserved.
//

#import "ParseJSON.h"

@interface ParseJSON ()

@end

@implementation ParseJSON

+ (NSData *)downloadJSONfromURL:(NSURL *)url {
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    return data;
}

+ (NSDictionary *)convertJSONData:(NSData*)data {
    
    NSDictionary *parseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return parseDict;
}

@end
