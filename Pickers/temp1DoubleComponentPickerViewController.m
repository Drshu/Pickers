//
//  temp1DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by shucheng on 16/2/25.
//  Copyright © 2016年 shucheng. All rights reserved.
//

#import "temp1DoubleComponentPickerViewController.h"

#define kFillingComponent 0
#define kBreadComponent 1

@interface temp1DoubleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong,nonatomic)NSArray *fillingTypes;
@property (strong,nonatomic)NSArray *breadTypes;
@end

@implementation temp1DoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fillingTypes = @[@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad",
                          @"Chicken Salad", @"Roast Beef", @"Vegemite"];
    self.breadTypes = @[@"White", @"Whole Wheat", @"Rye", @"Sourdough",
                        @"Seven Grain"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)buttonPressed:(id)sender {
    NSInteger fillingRow=[self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow =[self.doublePicker selectedRowInComponent:kBreadComponent];
    NSString *filling=self.fillingTypes[fillingRow];
    NSString *bread=self.breadTypes[breadRow];
    NSString *message=[[NSString alloc] initWithFormat:@"%@ on %@ bread will be right up.",filling,bread];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Thank you for your order"
                                                 message:message
                                                delegate:nil
                                       cancelButtonTitle:@"Great!"
                                       otherButtonTitles:nil];
    [alert show];
    
}


#pragma -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == kBreadComponent) {
        return [self.breadTypes count];
    }else{
        return [self.fillingTypes count];
    }

}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == kBreadComponent) {
        return self.breadTypes [row];
    }else{
        return self.fillingTypes[row];
    }
}

@end
