//
//  BREloAlgorithm.c
//  Bracketology
//
//  Created by Joel Angelone on 3/21/15.
//  Copyright (c) 2015 Draken Design. All rights reserved.
//

#import "BREloAlgorithm.h"

#import <stdlib.h>

int BREloInitialRating() {
    return 1500;
}

int BREloConstantForRating(int rating) {
    if (rating < 2000) {
        return 30;
    } else if (rating < 2400) {
        return 130 - (rating/20);
    }
    return 10;
}

float BREloConfidenceForRatingDifference(int ratingDifference) {
    if (ratingDifference == 0)
        return 0.5;
    else if (ratingDifference < 20)
        return 0.53;
    else if (ratingDifference < 40)
        return 0.58;
    else if (ratingDifference < 60)
        return 0.62;
    else if (ratingDifference < 80)
        return 0.66;
    else if (ratingDifference < 100)
        return 0.69;
    else if (ratingDifference < 120)
        return 0.73;
    else if (ratingDifference < 140)
        return 0.76;
    else if (ratingDifference < 160)
        return 0.79;
    else if (ratingDifference < 180)
        return 0.82;
    else if (ratingDifference < 200)
        return 0.84;
    else if (ratingDifference < 300)
        return 0.93;
    return 0.97;
}

int BREloRatingChangeForWin(int winnerRating, int loserRating) {
    int ratingDifference = abs(winnerRating - loserRating);
    int constant = BREloConstantForRating(winnerRating);
    float confidence =  BREloConfidenceForRatingDifference(ratingDifference);
    
    if (winnerRating > loserRating) {
        confidence = 1 - confidence;
    }
    
    return constant * confidence;
}