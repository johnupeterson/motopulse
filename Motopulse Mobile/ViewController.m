//
//  ViewController.m
//  Motopulse Mobile
//
//  Created by Cher Chronis on 10/12/16.
//  Copyright © 2016 Darkhorse Technology. All rights reserved.
//

#import "ViewController.h"
#import "globals.h"

NSString *ccid;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ccid = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"ccid"];
    NSLog(@"CCID: %@",ccid);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)motion_detection:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A1"]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)crash_detection:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A2"]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}

- (IBAction)deactivate_alarms:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A0"]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
    
}
- (IBAction)get_gps:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-GPS"]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)find_bike:(UISwitch *)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        NSLog(@"its on!");
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A3"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
    } else {
        NSLog(@"its off!");
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/motopulse-commands.php?phone=14086599322&command=1234-A0"]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"ret=%@", ret);
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

@end
