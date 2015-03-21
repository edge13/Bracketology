//
//  BRTeam.m
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import "BRTeam.h"

@implementation BRTeam

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%td-%td), rating=%d", _name, _wins, _losses, _rating];
}

@end
