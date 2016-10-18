//
//  ViewController.m
//  Motopulse Mobile
//
//  Created by Cher Chronis on 10/12/16.
//  Copyright © 2016 Darkhorse Technology. All rights reserved.
//

#import "ViewController.h"
#import "globals.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *alarm_sounder;
@property (weak, nonatomic) IBOutlet UISegmentedControl *detecting_setting;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    if ([moto_alarm  isEqual: @"3"]) {
        [_alarm_sounder setOn:YES animated:YES];
    } else {
        if ([moto_alarm  isEqual: @"2"]) {
            [_alarm_sounder setOn:NO animated:YES];
        } else {
            if ([moto_alarm  isEqual: @"1"]) {
                [_alarm_sounder setOn:NO animated:YES];
            } else {
                if ([moto_alarm  isEqual: @"0"]) {
                    [_alarm_sounder setOn:NO animated:YES];
            }
            }
        }}
    
    if ([moto_alarm isEqual: @"1" ]) {
    _detecting_setting.selectedSegmentIndex = 0;}
    
    if ([moto_alarm isEqual: @"2" ]) {
        _detecting_setting.selectedSegmentIndex = 1;}
    
    if ([moto_alarm isEqual: @"0" ]) {
        _detecting_setting.selectedSegmentIndex = -1;}

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deactivate_alarms:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A0"]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Alarm= %@",moto_alarm);
    moto_alarm = @"0";
    [[NSUserDefaults standardUserDefaults] setObject:moto_alarm forKey:@"moto_alarm"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bike Alarm" message:@"Command Sent To Stop Deactivate All Detections" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
    
}
- (IBAction)get_gps:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-GPS"]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GPS Locator" message:@"GPS Notification Sent - You will receive a message shortly with your bikes location.  If not, please try again." delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
}
- (IBAction)find_bike:(UISwitch *)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    
   
    
    
    if ([mySwitch isOn]) {
        NSLog(@"its on!");
        moto_alarm = @"3";
        [[NSUserDefaults standardUserDefaults] setObject:moto_alarm forKey:@"moto_alarm"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A3"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bike Alarm" message:@"Command Sent To Sound Bike Alarm" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        
        [alert show];
        
        
    } else {
        NSLog(@"its off!");
        moto_alarm = @"0";
        [[NSUserDefaults standardUserDefaults] setObject:moto_alarm forKey:@"moto_alarm"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A0"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bike Alarm" message:@"Command Sent To Stop Sounding Bike Alarm" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        
        [alert show];
    }
}
- (IBAction)record_route:(UISwitch *)sender {
    
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        NSLog(@"its on!");
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-WB=1"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
    } else {
        NSLog(@"its off!");
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-WB=0"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
    }

    
}
- (IBAction)detection:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    if (selectedSegment == 0) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A1"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Alarm=%@", moto_alarm);
        moto_alarm = @"1";
        [[NSUserDefaults standardUserDefaults] setObject:moto_alarm forKey:@"moto_alarm"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Detection Setting" message:@"Motion Detection Setting Sent" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        
        [alert show];

    
    }
    if (selectedSegment == 1) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A2"]];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Alarm=%@", moto_alarm);
        moto_alarm = @"2";
        [[NSUserDefaults standardUserDefaults] setObject:moto_alarm forKey:@"moto_alarm"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Detection Setting" message:@"Crash Detection Setting Sent" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        
        [alert show];

    }

    
    
}

@end
