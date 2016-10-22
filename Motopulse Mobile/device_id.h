//
//  device_id.h
//  Motopulse Mobile
//
//  Created by John Peterson on 10/17/16.
//  Copyright © 2016 Darkhorse Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface device_id : UIViewController{
    MKMapView *mapview;

}

@property (strong, nonatomic) IBOutlet MKMapView *mapview;
@end
