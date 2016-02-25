//
//  temp1DatePickerViewController.m
//  Pickers
//
//  Created by shucheng on 16/2/25.
//  Copyright © 2016年 shucheng. All rights reserved.
//

#import "temp1DatePickerViewController.h"

@interface temp1DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation temp1DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDate *now=[NSDate date];
    [self.datePicker setDate:now animated:NO];
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
    NSDate *selected=[self.datePicker date];
    NSString *message=[[NSString alloc]initWithFormat:@"The date and time you selectd is:%@",selected];
    UIAlertView *alert =[[UIAlertView alloc]
                         initWithTitle:@"Date and Time selected"
                         message:message
                         delegate:nil
                         cancelButtonTitle:@"That's so ture!"
                         otherButtonTitles:nil];
    [alert show];
}

@end
