//
//  NSString+PigLatin.m
//  OBJ-C-LAB7
//
//  Created by Ts SaM on 11/9/2023.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

- (NSString *)stringByPigLatinization {
    NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u", @"A", @"E", @"I", @"O", @"U"];
    NSMutableArray *pigLatinWords = [NSMutableArray array];
    NSArray *words = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    for (NSString *word in words) {
        NSString *firstLetter = [word substringToIndex:1];
        if ([vowels containsObject:firstLetter]) {
            NSString *pigLatinWord = [NSString stringWithFormat:@"%@%@", [firstLetter uppercaseString], [word substringFromIndex:1]];
            pigLatinWord = [pigLatinWord stringByAppendingString:@"way"];
            [pigLatinWords addObject:pigLatinWord];
        } else {
            NSRange range = [word rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"]];
            
            if (range.location != NSNotFound) {
                NSString *prefix = [word substringToIndex:range.location];
                NSString *suffix = [word substringFromIndex:range.location];
                
                NSString *pigLatinWord = [NSString stringWithFormat:@"%@%@%@", [[suffix substringToIndex:1] uppercaseString], [suffix substringFromIndex:1], prefix];
                pigLatinWord = [pigLatinWord stringByAppendingString:@"ay"];
                
                [pigLatinWords addObject:pigLatinWord];
            } else {
                NSString *pigLatinWord = [NSString stringWithFormat:@"%@%@", [firstLetter uppercaseString], [word stringByAppendingString:@"ay"]];
                [pigLatinWords addObject:pigLatinWord];
            }
        }
    }
    
    NSString *pigLatinSentence = [pigLatinWords componentsJoinedByString:@" "];
    return pigLatinSentence;
}

@end
