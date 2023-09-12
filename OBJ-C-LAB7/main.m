//
//  main.m
//  OBJ-C-LAB7
//
//  Created by Ts SaM on 11/9/2023.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *inputString = @"Kale Chips Area";
        NSString *lowercaseInput = [inputString lowercaseString];
        NSString *pigLatinString = [lowercaseInput stringByPigLatinization];
        NSLog(@"%@", pigLatinString);
    }
    return 0;
}
