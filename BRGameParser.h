//
//  BRGameParser.h
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRGameParser : NSObject

+ (NSArray *)gamesWithContentsOfFile:(NSString *)fileName;

@end
