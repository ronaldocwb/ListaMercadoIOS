//
//  MercadoTableViewController.m
//  ListaMercado
//
//  Created by Ronaldo Campos on 05/02/14.
//  Copyright (c) 2014 Ronaldo Campos. All rights reserved.
//

#import "MercadoTableViewController.h"
#import "MercadoAppDelegate.h"
#import "MercadoViewController.h"

@interface MercadoTableViewController (){

    MercadoAppDelegate *appDelegate;
    NSArray *displayArray;
    IBOutlet UISegmentedControl *segment;
    
}

@end

@implementation MercadoTableViewController

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
    
    appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.repository = [[MercadoRepository alloc] init];
    displayArray = appDelegate.repository.mercadorias;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self reloadList];
}

- (void) reloadList{
    if(segment.selectedSegmentIndex == 0){
        displayArray = [appDelegate.repository getAll];
    }else if(segment.selectedSegmentIndex == 1){
        displayArray = [appDelegate.repository getAllImportant];
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [displayArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Mercadoria *m = displayArray[indexPath.row];
    
    cell.textLabel.text = m.nome;
    
    if (m.importante) {
        cell.backgroundColor = [UIColor grayColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [appDelegate.repository removeMercadoriaByIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    MercadoViewController *mercadoViewController = [segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"addSegue"]) {
        mercadoViewController.mercadoriaIndex = -1;
    }else if ([segue.identifier isEqualToString:@"editSegue"]){
        NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
        mercadoViewController.mercadoriaIndex = ip.row;
    }
}

- (IBAction)selectorChange:(id)sender {
    [self reloadList];
}

@end
