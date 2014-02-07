//
//  SCHTipViewController.m
//  TipCalculator
//
//  Created by Joshua Dickens on 2/6/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "SCHTipViewController.h"

@interface SCHTipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *BillTextField;
@property (weak, nonatomic) IBOutlet UILabel *TotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *TipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation SCHTipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.BillTextField.text floatValue];
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.3)];
    float tipAmount = billAmount * [tipValues[self.TipControl.selectedSegmentIndex] floatValue];
    float finalAmount = billAmount + tipAmount;
    self.TipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.TotalLabel.text=[NSString stringWithFormat:@"$%0.2f", finalAmount];
}
@end
