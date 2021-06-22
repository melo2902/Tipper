//
//  SettingsViewController.m
//  Tipper
//
//  Created by mwen on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTip;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)stopTap:(id)sender {
    [self.view endEditing:true];
}

- (IBAction)onDefaultTipChange:(id)sender {
    double newDefault = [self.defaultTip.text doubleValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:0.2 forKey:@"defaultTip"];
    [defaults synchronize];
    
    self.defaultTip.text = [NSString stringWithFormat:@"%.2f", newDefault];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)defaultChange:(id)sender {
}
@end
