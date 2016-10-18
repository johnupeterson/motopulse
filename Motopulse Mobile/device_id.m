//
//  device_id.m
//  Motopulse Mobile
//
//  Created by John Peterson on 10/17/16.
//  Copyright © 2016 Darkhorse Technology. All rights reserved.
//

#import "device_id.h"
#import "globals.h"


@interface device_id ()
@property (weak, nonatomic) IBOutlet UITextField *device_id_form;
@property (weak, nonatomic) IBOutlet UIButton *device_id_display;

@end

@implementation device_id


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _device_id_form.text = ccid;
    [self.device_id_display setTitle:ccid forState:UIControlStateNormal];
    NSLog(@"CCID: %@",ccid);
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




- (IBAction)save_device_id:(id)sender {
    //Action For Save Button
    _device_id_form.text = _device_id_form.text;
    ccid = _device_id_form.text;
    
    
    [[NSUserDefaults standardUserDefaults] setObject:ccid forKey:@"ccid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    NSLog(@"The saved value is: %@",_device_id_form.text);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved Device ID" message:@"All commands will be sent to this new device" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
}

- (IBAction)transmit_settings:(id)sender {
    NSLog(@"Transmiting Settings");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sent Settings" message:@"Sucessfully Sent Settings To Your Motopulse" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    [alert show];
}


@end
