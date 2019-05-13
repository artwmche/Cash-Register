//
//  SecondViewController.m
//  Cash Register
//
//  Created by Arthur Cheung on 2018-10-19.
//  Copyright © 2018 Arthur Cheung. All rights reserved.
//

#import "SecondViewController.h"
#import "ResourceData.h"
#import "HistoryTableViewController.h"
#import "RestockViewController.h"

@interface SecondViewController ()<sendResourceProtocol>
@property (weak, nonatomic) IBOutlet UINavigationItem *NavBar;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"Cash Registar" style: UIBarButtonItemStylePlain target:self action:@selector(Back)];
    self.NavBar.leftBarButtonItem = backButton;
    // Do any additional setup after loading the view.
}
@synthesize delegate;
-(IBAction)Back{
    [self.delegate sendResourceToCR:self.rData];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"Dest Segue: %@",segue.identifier);
    if([segue.identifier isEqualToString: @"toHistory"]){
        HistoryTableViewController* destCrtler = segue.destinationViewController;
        destCrtler.rData = self.rData;
        destCrtler.historyArray = self.historyArray;
        destCrtler.delegate = self;
        
    }
    else{
        RestockViewController* destCrtler = segue.destinationViewController;
        destCrtler.rData = self.rData;
        destCrtler.historyArray = self.historyArray;
        destCrtler.delegate = self;
    }
}
- (void)sendResourceToCR:(ResourceData*)rData{
    self.rData = rData;
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
