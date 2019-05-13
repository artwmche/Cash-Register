//
//  ViewController.m
//  Cash Register
//
//  Created by Arthur Cheung on 2018-10-19.
//  Copyright © 2018 Arthur Cheung. All rights reserved.
//

#import "ViewController.h"
#import "ResourceData.h"
#import "SecondViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,sendResourceProtocolAgain>
@property (weak, nonatomic) IBOutlet UILabel *itemCount;
@property int flag;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property double itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (nonatomic,strong) ResourceData* rData;
@property (nonatomic,strong) NSMutableArray* historyArray;
@property (nonatomic,strong) NSMutableArray* pickArray;
@property (weak, nonatomic) IBOutlet UIPickerView *anArray;
@property (weak, nonatomic) IBOutlet UILabel *selectedItem;
@property (weak, nonatomic) IBOutlet UIPickerView *itemPicker;
@property int selectedItemIndex;
@end

@implementation ViewController

-(ResourceData*)rData{
    if(_rData==nil){
        _rData = [[ResourceData alloc]init];
    }
    return _rData;
}
-(NSMutableArray*)historyArray{
    if(_historyArray==nil){
        _historyArray = [[NSMutableArray alloc]init];
    }
    return _historyArray;
}
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
    //self.selectedItemIndex = 0;
    self.flag = 1;
    //self.pickArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)numClick:(id)sender {
    UIButton* aButton = (UIButton*)sender;
    NSLog(@"%@",aButton.titleLabel);
    if(self.flag == 1){
        self.itemCount.text =@"";
        self.flag = 0;
    }
    
    if(self.flag == 0){
        
        self.itemCount.text = [self.itemCount.text stringByAppendingString: aButton.titleLabel.text];
    }
}


- (IBAction)buyClick:(id)sender {
    NSLog(@"%d",self.selectedItemIndex);
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    int srcCnt = [self.itemCount.text intValue];
    int stockCnt = [[self.rData.countArray objectAtIndex: self.selectedItemIndex] intValue];
    if([self.itemCount.text rangeOfCharacterFromSet:notDigits].location == NSNotFound && srcCnt <= stockCnt){
        double value = [self.itemCount.text doubleValue] * [[self.rData.priceArray objectAtIndex: self.selectedItemIndex] doubleValue];
        NSNumberFormatter* fmt = [[NSNumberFormatter alloc]init];
        [fmt setPositiveFormat:@"0.00"];
        
        self.totalPrice.text = [NSString stringWithFormat: @"%@",[fmt stringFromNumber: [NSNumber numberWithFloat:value]]];
        
        NSMutableArray* historyEntry = [[NSMutableArray alloc]init];
        [historyEntry addObject:[self.rData.nameArray objectAtIndex: self.selectedItemIndex]];
        [historyEntry addObject:self.itemCount.text];
        [historyEntry addObject:self.totalPrice.text];
        [historyEntry addObject:[[NSDate alloc]init]];
        [self.historyArray addObject:historyEntry];
        self.itemCount.text = @"";
        historyEntry = nil;
        NSLog(@"%@",[self.rData.nameArray objectAtIndex: self.selectedItemIndex]);
        stockCnt = stockCnt - srcCnt;
        [self.rData.countArray replaceObjectAtIndex:self.selectedItemIndex withObject:[NSString stringWithFormat:@"%d",stockCnt]];
         self.pickArray = nil;
         [self.itemPicker reloadAllComponents];
    }
    self.itemCount.text=@"";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController* destCrtler = segue.destinationViewController;
    destCrtler.rData = self.rData;
    destCrtler.historyArray = self.historyArray;
    destCrtler.delegate = self;
}

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectedItemIndex = (int)row;
    self.selectedItem.text = [self.rData.nameArray objectAtIndex: row];
}

- (void)sendResourceToCR:(nonnull ResourceData *)rData {
    self.rData = rData;
    self.pickArray = nil;
    [self.itemPicker reloadAllComponents];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
