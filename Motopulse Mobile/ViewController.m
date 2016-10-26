//
//  ViewController.m
//  Motopulse Mobile
//
//  Created by Cher Chronis on 10/12/16.
//  Copyright © 2016 Darkhorse Technology. All rights reserved.
//

#import "ViewController.h"
#import "globals.h"
#import <Social/Social.h>





@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *alarm_sounder;
@property (weak, nonatomic) IBOutlet UISegmentedControl *detecting_setting;
@property (weak, nonatomic) IBOutlet UISwitch *voice_motion;
@property (weak, nonatomic) IBOutlet UISwitch *crash_motion;
@property (weak, nonatomic) IBOutlet UISwitch *record_ride_switch;
@property (weak, nonatomic) IBOutlet UISwitch *silent_alarm_switch;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([ride_tracking isEqual: @"1"]) {
        [_record_ride_switch setOn:YES animated:YES];}
        
        if ([ride_tracking isEqual: @"0"]) {
            [_record_ride_switch setOn:NO animated:YES];}
    
    if ([silent_alarm isEqual: @"1"]) {
        [_silent_alarm_switch setOn:YES animated:YES];}
    
    if ([silent_alarm isEqual: @"0"]) {
        [_silent_alarm_switch setOn:NO animated:YES];}
    
    
    
    if ([voice_crash_setting isEqual: @"1"]) {
        [_voice_motion setOn:YES animated:YES];}
    
    if ([voice_crash_setting isEqual: @"0"]) {
        [_voice_motion setOn:NO animated:YES];}
    
    if ([voice_crash_setting isEqual: @"3"]) {
        [_voice_motion setOn:YES animated:YES];}
    
    
    
    if ([voice_motion_setting isEqual: @"2"]) {
        [_crash_motion setOn:YES animated:YES];}
    
    if ([voice_motion_setting isEqual: @"0"]) {
        [_crash_motion setOn:NO animated:YES];}
    
    if ([voice_motion_setting isEqual: @"3"]) {
        [_crash_motion setOn:YES animated:YES];}

    
    
    
    
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
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-A0"]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Alarm= %@",moto_alarm);
    moto_alarm = @"0";
    [[NSUserDefaults standardUserDefaults] setObject:moto_alarm forKey:@"moto_alarm"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bike Alarm" message:@"Command Sent To Stop Deactivate All Detections" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
    [self viewDidLoad];
    
}
- (IBAction)get_gps:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-GPS"]];
    
    
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

        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-A3"]];
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
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-A0"]];
        
        
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
        
        ride_tracking = @"1";
        [[NSUserDefaults standardUserDefaults] setObject:ride_tracking forKey:@"ride_tracking"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-RT=1"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
    } else {
        NSLog(@"its off!");
        
        ride_tracking = @"0";
        [[NSUserDefaults standardUserDefaults] setObject:ride_tracking forKey:@"ride_tracking"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-RT=0"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
    }

    
}
- (IBAction)detection:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    if (selectedSegment == 0) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-A1"]];
        
        
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
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-A2"]];
        
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

- (IBAction)voice_crash_action:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        NSLog(@"its on!");
    
       
            voice_crash_setting = @"1";
        
        if ([voice_crash_setting  isEqual: @"1"] && [voice_motion_setting  isEqual: @"2"])
        {
            voice_crash_setting = @"3";
        }
        
        if ([voice_crash_setting  isEqual: @"1"] && [voice_motion_setting  isEqual: @"3"])
        {
            voice_crash_setting = @"3";
        }
        
    
        [[NSUserDefaults standardUserDefaults] setObject:voice_crash_setting forKey:@"voice_crash_setting"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@%@",motopulse_number,@"&command=",security_code,@"-VM=",voice_crash_setting]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
        NSLog(@"Setting = %@",voice_crash_setting);
    } else {
        NSLog(@"its off!");
        
       
            voice_crash_setting = @"0";
        
        if ([voice_crash_setting  isEqual: @"0"] && [voice_motion_setting  isEqual: @"2"])
        {
            voice_crash_setting = @"2";
        }
        
        if ([voice_crash_setting  isEqual: @"0"] && [voice_motion_setting  isEqual: @"3"])
        {
            voice_crash_setting = @"2";
           
        }
        
        
        [[NSUserDefaults standardUserDefaults] setObject:voice_crash_setting forKey:@"voice_crash_setting"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@%@",motopulse_number,@"&command=",security_code,@"-VM=",voice_crash_setting]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
         NSLog(@"Setting = %@",voice_crash_setting);
    }

    
}
- (IBAction)motion_action:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
         NSLog(@"its on!");
        
        
        voice_motion_setting = @"2";
        
        if ([voice_motion_setting  isEqual: @"2"] && [voice_crash_setting  isEqual: @"1"]   )
        {
            voice_motion_setting = @"3";
        }
        
        if ([voice_motion_setting  isEqual: @"2"] && [voice_crash_setting  isEqual: @"3"]   )
        {
            voice_motion_setting = @"3";
        }

        
    
        [[NSUserDefaults standardUserDefaults] setObject:voice_motion_setting forKey:@"voice_motion_setting"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@%@",motopulse_number,@"&command=",security_code,@"-VM=",voice_motion_setting]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
        NSLog(@"Setting = %@",voice_motion_setting);
    } else {
        NSLog(@"its off!");
        
       
            voice_motion_setting = @"0";
        
        if ([voice_motion_setting  isEqual: @"0"] && [voice_crash_setting  isEqual: @"1"]   )
        {
            voice_motion_setting = @"1";
        }
        
        if ([voice_motion_setting  isEqual: @"0"] && [voice_crash_setting  isEqual: @"3"]   )
        {
            voice_motion_setting = @"1";
        }

        
        voice_crash_setting = @"0";
        [[NSUserDefaults standardUserDefaults] setObject:voice_motion_setting forKey:@"voice_motion_setting"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@%@",motopulse_number,@"&command=",security_code,@"-VM=",voice_motion_setting]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
         NSLog(@"Setting = %@",voice_motion_setting);
    }

    
}
- (IBAction)postToFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        
       
        [controller addURL:[NSURL URLWithString:@"http://maps.google.com/?q=37.454468,-122.284835"]];
        [self presentViewController:controller animated:YES completion:Nil];
    }
    
}
- (IBAction)postToTwitter:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Check out my latest Motopulse Stats"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
}
- (IBAction)silent_alarm_action:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        NSLog(@"its on!");
        
        silent_alarm = @"1";
        [[NSUserDefaults standardUserDefaults] setObject:silent_alarm forKey:@"silent_alarm"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-S1"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
    } else {
        NSLog(@"its off!");
        
        silent_alarm = @"0";
        [[NSUserDefaults standardUserDefaults] setObject:silent_alarm forKey:@"silent_alarm"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=%@%@%@%@",motopulse_number,@"&command=",security_code,@"-S0"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
    }
    

}

@end
