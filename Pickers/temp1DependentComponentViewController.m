//
//  temp1DependentComponentViewController.m
//  Pickers
//
//  Created by shucheng on 16/2/25.
//  Copyright © 2016年 shucheng. All rights reserved.
//

#import "temp1DependentComponentViewController.h"

#define kStateComponent 0
#define kZipComPonent 1

@interface temp1DependentComponentViewController ()

@property (strong,nonatomic)NSDictionary *stateZips;
@property (strong,nonatomic)NSArray *states;
@property(strong,nonatomic)NSArray *zips;
@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;

@end

@implementation temp1DependentComponentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSBundle *bundle =[NSBundle mainBundle];
    NSURL *plistURL=[bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    
    self.stateZips=[NSDictionary
                    dictionaryWithContentsOfURL:plistURL];
    NSArray *allStates=[self.stateZips allKeys];
    NSArray *sortedStates = [allStates sortedArrayUsingSelector:@selector(compare:)];
    self.states=sortedStates;
    NSString *selectedState =self.states[0];
    self.zips=self.stateZips[selectedState];
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
    NSInteger stateRow=[self.dependentPicker
                        selectedRowInComponent:kStateComponent];
    NSInteger zipRow=[self.dependentPicker
                      selectedRowInComponent:kZipComPonent];
    
    NSString *state=self.states[stateRow];
    NSString *zip=self.zips[zipRow];
    NSString *title=[[NSString alloc]initWithFormat:@"You selected zip code %@.",zip];
    NSString *message=[[NSString alloc]initWithFormat:@"%@ is in %@",zip,state];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:title
                                                 message:message delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [alert show];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    if (component == kStateComponent) {
        return [self.states count];
    } else {
        return [self.zips count];
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        return self.states[row];
    } else {
        return self.zips[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        NSString *selectedState = self.states[row];
        self.zips = self.stateZips[selectedState];
        [self.dependentPicker reloadComponent:kZipComPonent];
        [self.dependentPicker selectRow:0
                            inComponent:kZipComPonent
                               animated:YES];
    }
}

@end
