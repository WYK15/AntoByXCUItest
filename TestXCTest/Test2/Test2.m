//
//  Test2.m
//  Test2
//
//  Created by wangyankun on 2020/12/3.
//  Copyright © 2020 shumei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCSynthesizedEventRecord.h"
#import "XCPointerEventPath.h"
#import "XCUIElement.h"
#import "XCTRunnerDaemonSession.h"

@interface Test2 : XCTestCase

@end

@implementation Test2

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

-(void) testPerformClick {
    //[self goHome];
    
    //[NSThread sleepForTimeInterval:2.0];
    
    //CGPoint point = CGPointMake(61, 69);
    CGPoint point = CGPointMake(120, 210);
    XCSynthesizedEventRecord *event = [self fb_generateTapEvent:point orientation:UIInterfaceOrientationPortrait];
    [[XCTRunnerDaemonSession sharedSession] synthesizeEvent:event completion:nil];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // UI tests must launch the application that they test.
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    [app launch];

    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}


- (XCSynthesizedEventRecord *)fb_generateTapEvent:(CGPoint)hitPoint orientation:(UIInterfaceOrientation)orientation
{
  XCPointerEventPath *eventPath = [[XCPointerEventPath alloc] initForTouchAtPoint:hitPoint offset:0.0];
  [eventPath liftUpAtOffset:0.01f];
  if (![XCTRunnerDaemonSession sharedSession].useLegacyEventCoordinateTransformationPath) {
    orientation = UIInterfaceOrientationPortrait;
  }
  XCSynthesizedEventRecord *event =
  [[XCSynthesizedEventRecord alloc]
   initWithName:[NSString stringWithFormat:@"Tap on %@", NSStringFromCGPoint(hitPoint)]
   interfaceOrientation:orientation];
  [event addPointerEventPath:eventPath];
  return event;
}


-(void) goHome {
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
}

@end
