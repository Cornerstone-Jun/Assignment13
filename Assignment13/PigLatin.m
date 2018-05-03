//
//  PigLatin.m
//  Assignment13
//
//  Created by Jumpei on 2018-05-01.
//  Copyright © 2018 Jumpei. All rights reserved.
//

#import "PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization {
    
    
    NSMutableArray *letters = [[NSMutableArray alloc] initWithCapacity:[self length]];
    for (int i=0; i < [self length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [self characterAtIndex:i]];
        [letters addObject:ichar];
    }
    NSLog(@"letters: %@", [letters componentsJoinedByString:@""]);
    
    NSCharacterSet *consonants = [NSCharacterSet characterSetWithCharactersInString:@"Something"];
    
    NSMutableArray *consonantChunks = [[self componentsSeparatedByCharactersInSet:consonants] mutableCopy];
    NSString *firstChunk = [consonantChunks objectAtIndex:0];
    NSLog(@"firstChunk: %@", firstChunk);
    
    NSMutableArray *chunkRange = [[NSMutableArray alloc] initWithCapacity:[firstChunk length]];
    for (int i=0; i < [firstChunk length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [firstChunk characterAtIndex:i]];
        [chunkRange addObject:ichar];
    }
    NSLog(@"chunkRange: %@", [chunkRange componentsJoinedByString:@""]);
    
    
    NSRange range = NSMakeRange(0, [firstChunk length]);
    
    [letters removeObjectsInRange:range];
    
    [letters addObject:firstChunk];
    [letters addObject:@"ay"];
    
    NSString *finalWord =  [letters componentsJoinedByString:@""];
    
    return finalWord;
}

@end


