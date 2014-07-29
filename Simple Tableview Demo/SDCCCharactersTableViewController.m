//
//  SDCCCharachtersTableViewController.m
//  Simple Tableview Demo
//
//  Created by Wim Drapier on 21/07/14.
//  Copyright (c) 2014 Sadicco. All rights reserved.
//

#import "SDCCCharactersTableViewController.h"
#import "SDCCTrueBloodCharacterData.h"
#import "SDCCCharacter.h"
#import "SDCCCharacterImageViewController.h"
#import "SDCCCharacterDetailViewController.h"

@interface SDCCCharactersTableViewController ()

@end

@implementation SDCCCharactersTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.characters = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *charachterData in [SDCCTrueBloodCharacterData allCharachters]) {
        NSString *imageName = [NSString stringWithFormat:@"%@.png", charachterData[NAME]];
        SDCCCharacter *character = [[SDCCCharacter alloc] initWithData:charachterData andImage:[UIImage imageNamed:imageName]];
        [self.characters addObject:character];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.characters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    SDCCCharacter *character = [self.characters objectAtIndex:indexPath.row];
    cell.textLabel.text = character.name;
    cell.detailTextLabel.text = character.fullname;
    cell.imageView.image = character.image;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[SDCCCharacterImageViewController class]]) {
            SDCCCharacterImageViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            SDCCCharacter *selectCharacter = [self.characters objectAtIndex:indexPath.row];
            nextViewController.character = selectCharacter;
        }
    }
    
    if ([sender isKindOfClass:[NSIndexPath class]]) {
        if ([segue.destinationViewController isKindOfClass:[SDCCCharacterDetailViewController class]]) {
            SDCCCharacterDetailViewController *characterDetailViewController = segue.destinationViewController;
            NSIndexPath *indexPath = sender;
            characterDetailViewController.charachter = self.characters[indexPath.row];
        }
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"characterdetails" sender:indexPath];
}

@end
