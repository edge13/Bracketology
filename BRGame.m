//
//  BRGame.m
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import "BRGame.h"

@implementation BRGame

- (NSString *)identifier {
    NSString *team1 = [_homeTeam compare:_awayTeam] == NSOrderedAscending ? _homeTeam : _awayTeam;
    NSString *team2 = [_homeTeam compare:_awayTeam] == NSOrderedAscending ? _awayTeam: _homeTeam;
    
    return [NSString stringWithFormat:@"%@%@%@%td", _date, team1, team2, _homeScore+_awayScore];
}

@end
