//
//  ViewController.m
//  TestXCTest
//
//  Created by wangyankun on 2020/12/2.
//  Copyright © 2020 shumei. All rights reserved.
//

#import "ViewController.h"
#import <XCTest/XCTest.h>
//#import "Headers/XCUIDevice.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //XCUIDevice *thisdevice = [XCUIDevice sharedDevice];sharedDevice
    XCUIDevice *thisdevice = [XCUIDevice sharedDevice];
    
    if (thisdevice) {
        [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
    }else{
        NSLog(@"no device");
    }
    
    
    
}


@end
