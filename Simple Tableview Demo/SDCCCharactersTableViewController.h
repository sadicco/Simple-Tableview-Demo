//
//  SDCCCharachtersTableViewController.h
//  Simple Tableview Demo
//
//  Created by Wim Drapier on 21/07/14.
//  Copyright (c) 2014 Sadicco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCCCharacterAddViewController.h"
#import "SDCCCharacter.h"

@interface SDCCCharactersTableViewController : UITableViewController <SDCCCharacterAddViewControllerDelegate>

@property (strong, nonatomic)NSMutableArray *characters;

@end
