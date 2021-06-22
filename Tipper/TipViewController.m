//
//  TipViewController.m
//  Tipper
//
//  Created by mwen on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UILabel *splitAmt;
@property (weak, nonatomic) IBOutlet UITextField *split;

@end

@implementation TipViewController
//bool isHidden = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:true];
   
}

- (IBAction)updateLabels:(id)sender {
    if (self.billAmountField.text.length == 0){
        [self hideLabels];
    } else {
        [self showLabels];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double savedDefault = [defaults doubleForKey:@"defaultTip"];
    
    double tipPercentages[] = {0.15, 0.2, 0.25, savedDefault};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    // Convert from string to numbers
    double bill = [self.billAmountField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    double split = total / [self.split.text intValue];
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    self.splitAmt.text = [NSString stringWithFormat:@"$%.2f", split];
}

- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        
        billFrame.origin.y += 200;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
       
    }];
}

- (IBAction)animateUp:(id)sender {
    CGRect billFrame = self.billAmountField.frame;
    
    if (billFrame.origin.y > 0){
        CGRect billFrame = self.billAmountField.frame;
        
        billFrame.origin.y -= 200;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y -= 200;
        
        self.labelsContainerView.frame = labelsFrame;
    }
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        self.labelsContainerView.alpha = 1;
        
//        CGRect billFrame = self.billAmountField.frame;
//
//        billFrame.origin.y = 0;
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double savedDefault = [defaults doubleForKey:@"defaultTip"];
    
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
