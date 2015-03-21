//
//  main.m
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BREloAlgorithm.h"
#import "BRGame.h"
#import "BRGameParser.h"
#import "BRTeamManager.h"

static int const BRIterations = 1;
static int const BRReportCount = 64;

void BRApplyElo(NSArray *games, BRTeamManager *teamManager) {
    for (int i = 0; i < BRIterations; i++) {
        for (BRGame *game in games) {
            BRTeam *homeTeam = [teamManager teamWithName:[game homeTeam]];
            BRTeam *awayTeam = [teamManager teamWithName:[game awayTeam]];
            
            BRTeam *winner = [game awayScore] > [game homeScore] ? awayTeam : homeTeam;
            BRTeam *loser = winner == homeTeam ? awayTeam : homeTeam;
            
            [winner setWins:[winner wins] + 1];
            [loser setLosses:[loser losses] + 1];
            
            int ratingChange = BREloRatingChangeForWin([winner rating], [loser rating]);
            [winner setRating:[winner rating] + ratingChange];
            [loser setRating:[loser rating] - ratingChange];
        }
    }
}

void BRReportRankings(BRTeamManager *teamManager) {
    NSArray *rankedTeams = [teamManager teamsSortedByRating];
    
    NSLog(@"Top %d teams:", BRReportCount);
    for (int i = 0; i < BRReportCount; i++) {
        NSLog(@"%d [expected seed %d]. %@", i + 1, i/4 + 1, rankedTeams[i]);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *games = [BRGameParser gamesWithContentsOfFile:@"games.csv"];
        
        BRTeamManager *teamManager = [BRTeamManager new];
    
        BRApplyElo(games, teamManager);
        BRReportRankings(teamManager);
    }
    return 0;
}
