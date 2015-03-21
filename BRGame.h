//
//  BRGame.h
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRGame : NSObject

@property (nonatomic, copy) NSString *homeTeam;
@property (nonatomic, copy) NSString *awayTeam;
@property (nonatomic, assign) NSInteger homeScore;
@property (nonatomic, assign) NSInteger awayScore;
@property (nonatomic, assign) BOOL neutralSite;
@property (nonatomic, strong) NSString *date;

@property (nonatomic, readonly) NSString *identifier;

@end
