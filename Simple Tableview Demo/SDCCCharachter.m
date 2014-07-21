//
//  SDCCCharachter.m
//  Simple Tableview Demo
//
//  Created by Wim Drapier on 21/07/14.
//  Copyright (c) 2014 Sadicco. All rights reserved.
//

#import "SDCCCharachter.h"
#import "SDCCTrueBloodCharachterData.h"

@implementation SDCCCharachter

- (id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

//designated initializer
- (id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    
    self.name = data[NAME];
    self.fullname = data[FULLNAME];
    self.image = image;
    
    return self;
}

@end
