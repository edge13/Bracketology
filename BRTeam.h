//
//  BRTeam.h
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRTeam : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger wins;
@property (nonatomic, assign) NSInteger losses;
@property (nonatomic, assign) int rating;

@end
