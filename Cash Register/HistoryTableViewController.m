














//
//  HistoryTableViewController.m
//  Cash Register
//
//  Created by Arthur Cheung on 2018-10-19.
//  Copyright © 2018 Arthur Cheung. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "HistoryDetailViewController.h"

@interface HistoryTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationItem *NavBar;
@end

@implementation HistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"Tasks" style: UIBarButtonItemStylePlain target:self action:@selector(Back)];
    [self.NavBar setLeftBarButtonItem: backButton];
    
    // Do any additional setup after loading the view.
}
-(IBAction)Back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.historyArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    //[tableView dequeueReusableCellWithIdentifier:<#(nonnull NSString *)#> forIndexPath:<#(nonnull NSIndexPath *)#>]
    
    cell.textLabel.text = [(NSMutableArray*)[self.historyArray objectAtIndex: indexPath.row] objectAtIndex: 0];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",(NSString*)[(NSMutableArray*)[self.historyArray objectAtIndex: indexPath.row] objectAtIndex: 1] ];
    NSLog(@"%d",(int)indexPath.row);
    NSLog(@"%@",[(NSMutableArray*)[self.historyArray objectAtIndex: indexPath.row] objectAtIndex: 0]);
    NSLog(@"%@",[NSString stringWithFormat:@"%@",(NSString*)[(NSMutableArray*)[self.historyArray objectAtIndex: indexPath.row] objectAtIndex: 1] ]);
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UITableViewCell* cell = (UITableViewCell*)sender;
    UITableView* table = (UITableView*)[cell superview];
    NSIndexPath* cellPath = [table indexPathForCell:cell];
    NSInteger cellRowNo = [cellPath row];
    NSLog(@"row no. %d",(int)cellRowNo);
    HistoryDetailViewController* destCrtler = segue.destinationViewController;
    destCrtler.historyEntry = [self.historyArray objectAtIndex:cellRowNo];
}


@end
