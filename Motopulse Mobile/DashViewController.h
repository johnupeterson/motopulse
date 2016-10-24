//
//  DashViewController.h
//  Motopulse Mobile
//
//  Created by John Peterson on 10/23/16.
//  Copyright © 2016 Darkhorse Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DashViewController : UIViewController

{
    MKMapView *mapview;
    
}
@property (weak, nonatomic) IBOutlet MKMapView *mapview;


@end
