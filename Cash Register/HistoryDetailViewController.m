//
//  HistoryDetailViewController.m
//  Cash Register
//
//  Created by Arthur Cheung on 2018-10-21.
//  Copyright © 2018 Arthur Cheung. All rights reserved.
//

#import "HistoryDetailViewController.h"

@interface HistoryDetailViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *NavBar;
@property (weak, nonatomic) IBOutlet UITextField *itemName;
@property (weak, nonatomic) IBOutlet UITextField *unit;
@property (weak, nonatomic) IBOutlet UITextField *salePrice;
@property (weak, nonatomic) IBOutlet UITextField *saleDate;


@end

@implementation HistoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"History List" style: UIBarButtonItemStylePlain target:self action:@selector(Back)];
    self.NavBar.leftBarButtonItem = backButton;
    // Do any additional setup after loading the view.
    self.itemName.text = [self.historyEntry objectAtIndex:0];
    self.unit.text = [self.historyEntry objectAtIndex:1];
    self.salePrice.text = [self.historyEntry objectAtIndex:2];
    NSDate* sDate = (NSDate*)[self.historyEntry objectAtIndex:3];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm:ss"];
    self.saleDate.text = [dateFormatter stringFromDate:sDate];
}
-(IBAction)Back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
