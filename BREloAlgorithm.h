//
//  BREloAlgorithm.h
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#ifndef Bracketology_BREloAlgorithm_h
#define Bracketology_BREloAlgorithm_h

int BREloInitialRating();
int BREloConstantForRating(int rating);
int BREloRatingChangeForWin(int winnerRating, int loserRating);

float BREloConfidenceForRatingDifference(int ratingDifference);

#endif
