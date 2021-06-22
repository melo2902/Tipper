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
@property (weak, nonatomic) IBOutlet UITextField *splitNumber;
@property (weak, nonatomic) IBOutlet UILabel *splitAmtLabel;

@end

@implementation TipViewController
bool isHidden = false;
//double defaultTip = [defaults doubleForKey:@"defaultTip"];

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
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    double savedDefault = [defaults doubleForKey:@"defaultTip"];
    
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    // Convert from string to numbers
    double bill = [self.billAmountField.text doubleValue];
    int splitNumber = [self.splitNumber.text intValue];
    
    double tip = bill * tipPercentage;
    double total = bill + tip;
    double split = total / splitNumber;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    self.splitAmtLabel.text = [NSString stringWithFormat:@"$%.2f", split];
}

- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        isHidden = true;
        
        CGRect billFrame = self.billAmountField.frame;
        
        billFrame.origin.y += 200;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
       
    }];
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        self.labelsContainerView.alpha = 1;
        
        if (isHidden == true){
            CGRect billFrame = self.billAmountField.frame;
            
            billFrame.origin.y -= 200;
            
            self.billAmountField.frame = billFrame;
            
            CGRect labelsFrame = self.labelsContainerView.frame;
            labelsFrame.origin.y -= 200;
            
            self.labelsContainerView.frame = labelsFrame;
            
            isHidden = false;
        }
    }];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    double savedDefault = [defaults doubleForKey:@"defaultTip"];
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
