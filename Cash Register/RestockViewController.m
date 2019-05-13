//
//  RestockViewController.m
//  Cash Register
//
//  Created by Arthur Cheung on 2018-10-19.
//  Copyright © 2018 Arthur Cheung. All rights reserved.
//

#import "RestockViewController.h"

@interface RestockViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationItem *NavBar;
@property (weak, nonatomic) IBOutlet UITextField *restockCount;
@property (nonatomic,strong) NSMutableArray* pickArray;
@property int selectedItemIndex;
@property (weak, nonatomic) IBOutlet UIPickerView *restockPicker;
@end

@implementation RestockViewController
-(NSMutableArray*)pickArray{
    if (_pickArray == nil){
        _pickArray = [[NSMutableArray alloc]init];
        for(int i = 0; self.rData.nameArray.count > i; i++){
            NSString* item1 = [self.rData.nameArray objectAtIndex: i];
            NSString* item2 = [self.rData.countArray objectAtIndex: i];
            NSString* item3 = [self.rData.priceArray objectAtIndex: i];
            NSString* value = [NSString stringWithFormat:@"%@ %@ price:%@",item1,item2,item3 ];
            [_pickArray addObject: value];
        }
    }
    return _pickArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"Tasks" style: UIBarButtonItemStylePlain target:self action:@selector(Back)];
    [self.NavBar setLeftBarButtonItem: backButton];
    
    
    // Do any additional setup after loading the view.
}
@synthesize delegate;
-(IBAction)Back{
    [self.delegate sendResourceToCR:self.rData];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelClick:(id)sender {
    self.restockCount.text = @"";
}
- (IBAction)okClick:(id)sender {
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if([self.restockCount.text rangeOfCharacterFromSet:notDigits].location == NSNotFound){
        int count = [(NSString*)[self.rData.countArray objectAtIndex: self.selectedItemIndex] intValue];
        int addValue = [self.restockCount.text intValue];
        NSString* finalValTxt = [NSString stringWithFormat:@"%d",(count+addValue)];
        [self.rData.countArray replaceObjectAtIndex:self.selectedItemIndex withObject:finalValTxt];
        self.pickArray = nil;
        [self.restockPicker reloadAllComponents];
        self.restockCount.text=@"";
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.pickArray objectAtIndex:row];
    
    
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.pickArray.count;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectedItemIndex = (int)row;
    self.NavBar.title = [self.rData.nameArray objectAtIndex: row];
}
@end
