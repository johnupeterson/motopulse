//
//  ViewController.m
//  MotoPulse
//
//  Created by John Peterson on 10/8/16.
//  Copyright © 2016 John Peterson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)activate_motion_detection:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A1"]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
    
}
- (IBAction)activate_crash_detection:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A2"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)sound_alarm:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086744121&command=1234-A3"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)deactivate_all:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A0"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)find_gps:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-GPS"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)view_ride:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-R1"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)restore_motopulse:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-5108"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)set_biker_number:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-CELL=14086744121"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)set_friend_number:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-ENUM=14086744121"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)activate_ride:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-WB=1"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)deactivate_ride:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-WB=0"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)set_pin:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-PIN=1234"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}

@end
