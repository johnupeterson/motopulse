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

@property (weak, nonatomic) IBOutlet UITextField *motion_notification_number;
@property (weak, nonatomic) IBOutlet UITextField *crash_notification_number;
@property (weak, nonatomic) IBOutlet UITextField *device_id_form;
@property (weak, nonatomic) IBOutlet UITextField *security_code_form;



@end

@implementation device_id


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _device_id_form.text = ccid;
    _motion_notification_number.text = biker_number;
    _crash_notification_number.text = crash_number;
    _security_code_form.text = security_code;
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




- (IBAction)security_code_action:(id)sender {
    //Action For Save Button
    _security_code_form.text = _security_code_form.text;
    security_code = _security_code_form.text;
    
    
    [[NSUserDefaults standardUserDefaults] setObject:ccid forKey:@"security_code"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    NSLog(@"The saved value is: %@",_security_code_form.text);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved Security_Code" message:@"Security Code Used To Send Commands To Motopulse Saved." delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
}






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
- (IBAction)save_motion_number:(id)sender {
    _motion_notification_number.text = _motion_notification_number.text;
    biker_number = _motion_notification_number.text;
    [[NSUserDefaults standardUserDefaults] setObject:biker_number forKey:@"biker_number"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"The saved value is: %@",_motion_notification_number.text);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved Motion Notification" message:@"Motion Notification Number Set" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
    
}
- (IBAction)save_crash_number:(id)sender {
    _crash_notification_number.text = _crash_notification_number.text;
    crash_number = _crash_notification_number.text;
    [[NSUserDefaults standardUserDefaults] setObject:crash_number forKey:@"crash_number"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"The saved value is: %@",_crash_notification_number.text);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved Crash Notification" message:@"Crash Notification Number Set" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
}


@end
