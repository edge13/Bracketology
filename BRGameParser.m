//
//  BRGameParser.m
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import "BRGameParser.h"
#import "BRGame.h"

static NSInteger const BRGameParserGameDateIndex = 0;
static NSInteger const BRGameParserGameTypeIndex = 11;
static NSInteger const BRGameParserHomeTeamNameIndex = 1;
static NSInteger const BRGameParserAwayTeamNameIndex = 4;
static NSInteger const BRGameParserHomeTeamScoreIndex = 3;
static NSInteger const BRGameParserAwayTeamScoreIndex = 5;
static NSInteger const BRGameParserNeutralSiteScoreIndex = 9;
static NSInteger const BRGameParserHomeAwayInvertedIndex = 2;

static NSString * const BRGameTypeDivisionOne = @"Division 1";
static NSString * const BRGameAway = @"Away";
static NSString * const BRGameNeutralSite = @"Neutral Site";

@implementation BRGameParser

+ (NSArray *)gamesWithContentsOfFile:(NSString *)fileName {
    NSMutableDictionary *games = [NSMutableDictionary new];
    
    NSString *data = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [data componentsSeparatedByString:@"\n"];
    
    for (NSString *line in lines) {
        NSArray *items = [line componentsSeparatedByString:@","];
        
        NSString *gameType = items[BRGameParserGameTypeIndex];
        
        if (![gameType isEqualToString:BRGameTypeDivisionOne]) {
            continue;
        }
        
        BOOL homeAwayInverted = [items[BRGameParserHomeAwayInvertedIndex] isEqualToString:BRGameAway];
        NSInteger homeScoreIndex = homeAwayInverted ? BRGameParserAwayTeamScoreIndex : BRGameParserHomeTeamScoreIndex;
        NSInteger awayScoreIndex = homeAwayInverted ? BRGameParserHomeTeamScoreIndex : BRGameParserAwayTeamScoreIndex;

        NSInteger homeNameIndex = homeAwayInverted ? BRGameParserAwayTeamNameIndex : BRGameParserHomeTeamNameIndex;
        NSInteger awayNameIndex = homeAwayInverted ? BRGameParserHomeTeamNameIndex : BRGameParserAwayTeamNameIndex;
        
        BOOL isNeutralSite = [items[BRGameParserNeutralSiteScoreIndex] isEqualToString:BRGameNeutralSite];
        
        BRGame *game = [BRGame new];
        [game setHomeTeam:items[homeNameIndex]];
        [game setAwayTeam:items[awayNameIndex]];
        [game setHomeScore:[items[homeScoreIndex] integerValue]];
        [game setAwayScore:[items[awayScoreIndex] integerValue]];
        [game setDate:items[BRGameParserGameDateIndex]];
        [game setNeutralSite:isNeutralSite];
        
        NSString *identifier = [game identifier];
        
        games[identifier] = game;
    }

    return [games allValues];
}

@end
