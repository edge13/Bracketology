//
//  BRTeamManager.m
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import "BRTeamManager.h"
#import "BREloAlgorithm.h"

@implementation BRTeamManager {
    NSMutableDictionary *_teams;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _teams = [NSMutableDictionary new];
    }
    return self;
}

- (BRTeam *)teamWithName:(NSString *)name {
    BRTeam *team = _teams[name];
    if (!team) {
        team = [BRTeam new];
        [team setName:name];
        [team setRating:BREloInitialRating()];
        _teams[name] = team;
    }
    return team;
}

- (NSArray *)teamsSortedByRating {
    NSArray *allTeams = [_teams allValues];
 
    return [allTeams sortedArrayUsingComparator:^NSComparisonResult(BRTeam *t1, BRTeam *t2) {
        if ([t1 rating] > [t2 rating]) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
}

@end
