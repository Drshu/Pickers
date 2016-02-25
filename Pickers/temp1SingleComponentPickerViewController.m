//
//  temp1SingleComponentPickerViewController.m
//  Pickers
//
//  Created by shucheng on 16/2/25.
//  Copyright © 2016年 shucheng. All rights reserved.
//

#import "temp1SingleComponentPickerViewController.h"

@interface temp1SingleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong,nonatomic) NSArray *characterNames;
@end

@implementation temp1SingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca",
                            @"Artoo", @"Threepio", @"Lando"];
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
    NSInteger row=[self.singlePicker selectedRowInComponent:0];
    NSString *selected=self.characterNames[row];
    NSString *title=[[NSString alloc]initWithFormat:@"You selected %@",selected];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:title
                                                 message:@"Thank you for choosing"
                                                delegate:nil
                                                cancelButtonTitle:@"You'r welcome"
                                                otherButtonTitles:nil];
    [alert show];
}

#pragma mark -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{//包括了选取器所需的新方法，除了日期选取器之外，都会需要实现这两个方法，第一个方法是询问有几个滚轮
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{//第二个方法是询问确定的滚轮应该有多少行数据
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.characterNames[row];
}

@end
