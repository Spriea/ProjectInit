//
//  SKHomeVC.m
//  Urgency
//
//  Created by Somer.King on 2019/4/4.
//  Copyright © 2019 Somer.King. All rights reserved.
//

#import "SKHomeVC.h"
#import <MapKit/MapKit.h>

@interface SKHomeVC ()<MKMapViewDelegate>

@property (strong, nonatomic) MKMapView *mapView;

@end

@implementation SKHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
}

@end
