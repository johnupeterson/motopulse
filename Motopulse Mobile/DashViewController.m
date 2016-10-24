//
//  DashViewController.m
//  Motopulse Mobile
//
//  Created by John Peterson on 10/23/16.
//  Copyright © 2016 Darkhorse Technology. All rights reserved.
//

#import "DashViewController.h"
#import "globals.h"

@interface DashViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bike_time;
@property (weak, nonatomic) IBOutlet UILabel *bike_speed_label;

@property (weak, nonatomic) IBOutlet UILabel *miles_label;

@end

@implementation DashViewController
@synthesize mapview = _mapview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/mp-get-lat.php?ccid=%@",ccid]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Latitude: %@",ret);
    double latdouble = [ret doubleValue];
    
    NSURL *url2 = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/mp-get-lon.php?ccid=%@",ccid]];
    NSData *data2 = [NSData dataWithContentsOfURL:url2];
    NSString *ret2 = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
    NSLog(@"Longitude: %@",ret2);
    double londouble = [ret2 doubleValue];
    
    NSURL *url3 = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/mp-get-speed.php?ccid=%@",ccid]];
    NSData *data3 = [NSData dataWithContentsOfURL:url3];
    NSString *ret3 = [[NSString alloc] initWithData:data3 encoding:NSUTF8StringEncoding];
    NSLog(@"Average Bike Speed: %@",ret3);
    
    _bike_speed_label.text = ret3;
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"http://voiceserver1.jarviswireless.com/mp-get-time.php?ccid=%@",ccid]];
    NSData *data4 = [NSData dataWithContentsOfURL:url4];
    NSString *ret4 = [[NSString alloc] initWithData:data4 encoding:NSUTF8StringEncoding];
    float bike_time = [ret4 floatValue];
    bike_time = bike_time/60;
    
    NSLog(@"Average Bike Speed: %f",bike_time);
    NSString *bike_time_string = [NSString stringWithFormat:@"%.02f", bike_time];
    
    
    _bike_time.text = bike_time_string;
    
    float speed = [ret3 floatValue];
    
    float miles = speed * bike_time;
    NSLog(@"Miles Traveled: %f",miles);
    
    NSString *string_miles = [NSString stringWithFormat:@"%.02f", miles];
    _miles_label.text = string_miles;
    
    
    
    MKCoordinateRegion thisRegion = {{0.0,0.0}, {0.0,0.0}};
    // thisRegion.center.latitude = 37.443832;
    thisRegion.center.latitude = latdouble;
    // thisRegion.center.longitude = -122.264147;
    thisRegion.center.longitude = londouble;
    
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 37.443832;
    coordinate.longitude = -122.264147;
    
    thisRegion.center = coordinate;
    
    thisRegion.span.latitudeDelta = 0.01f;
    thisRegion.span.longitudeDelta = 0.01f;
    
    MKPlacemark *mPlacemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    
    [self.mapview addAnnotation:mPlacemark];
    [self.mapview setRegion:thisRegion animated:YES];
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

@end