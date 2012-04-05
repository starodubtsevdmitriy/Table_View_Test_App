//
//  TableViewViewController.m
//  TableViewTestApp
//
//  Created by Dmitriy Starodubtsev on 25.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewViewController.h"

@implementation TableViewViewController  

@synthesize dataController = _dataController;
@synthesize myView;

- (id)initWithStyle:(UITableViewStyle)style {
    return self;
}

- (void)loadView {                                 // create and configure the view
    CGRect cgRct = CGRectMake(0, 0, 320, 400);     //define size and position of view 
    myView = [[UIView alloc] initWithFrame:cgRct]; //initilize the view    
    myView.autoresizesSubviews = YES;              //allow it to tweak size of elements in view 
    self.view = myView;                            //set view property of controller to the newly created view    
    UITableView * tableView = [[UITableView alloc] initWithFrame:cgRct style:UITableViewStylePlain];
    tableView.editing = YES;                       //This allows user of progrm to add or remove elements from list
    tableView.dataSource = self;
    tableView.delegate = self;                     //make the current object the event handler for view
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return [self.dataController countOfList] + 1;  // Only one section so return the number of items in the list
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];//Try to get rusable cell
    if (cell == nil)  {                            //If not possible create a new cell
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectMake(0,0,0,0) reuseIdentifier:@"CellIdentifier"]autorelease];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if(indexPath.row == 0) {                        // Get the string to display and set the value in the cell
        cell.text  = @"Add New Item...";                //The first (or zeroth cell) contains a New Item string and is used to add elements to list

    }
    else {                                          //Retreive text from datasource, the -1 accounts for the first element being hardcoded to say new Item
        NSString* itemText = [self.dataController objectInListAtIndex:indexPath.row - 1]; 
        cell.text = itemText;
    }
    return cell;
}
                                                    //Disable reorder the first row
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return NO;
    }
    else {
        return YES;
    }
}
                                                    //Reordering of list
-  (void)tableView:(UITableView *)tableView        
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
       toIndexPath:(NSIndexPath *)toIndexPath {
    if (fromIndexPath.row  != 0) {
    NSString *item = [[self.dataController.list objectAtIndex:fromIndexPath.row-1] retain];
    [self.dataController.list removeObject:item];
        if (toIndexPath.row > [self.dataController countOfList]) {
            [self.dataController.list insertObject:item atIndex:[self.dataController countOfList]];
        }
        else if (toIndexPath.row < 1) {
            [self.dataController.list insertObject:item atIndex:0];
        }
        else {
            [self.dataController.list insertObject:item atIndex:toIndexPath.row-1];
        }
        [item release];
    }
    [tableView reloadData];
}
                                                   //Set style of cells      
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    }
    else {
        return UITableViewCellEditingStyleDelete;
    }
}
                                                    //Add and delete cells
- (void) tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
 forRowAtIndexPath:(NSIndexPath *)indexPath {       // If row is deleted, remove it from the list. 
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataController removeDataAtIndex:indexPath.row-1];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert) {
        NSString *newItem = [NSString stringWithFormat:@"New item %d", [self.dataController countOfList]+1];
        [self.dataController addData:newItem];
        [tableView reloadData];
    }
}

- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.dataController = [[DataController alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
