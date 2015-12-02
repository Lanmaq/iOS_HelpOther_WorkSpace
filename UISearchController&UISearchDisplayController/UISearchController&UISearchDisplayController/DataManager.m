//
//  DataManager.m
//  UISearchController&UISearchDisplayController
//
//  Created by zml on 15/12/2.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.
//

#import "DataManager.h"
#import "DemoModel.h"

@implementation DataManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.testDataArray = [self createTestDataArray];
    }
    return self;
}

-(NSArray *)createTestDataArray
{
    NSArray *testModels = @[
                            [DemoModel  modelWithName:@"Lanmaq" friendId:@"15668689942" imageData:UIImageJPEGRepresentation([UIImage imageNamed:@"1.jpg"], 0.3)],
                            [DemoModel  modelWithName:@"May" friendId:@"2452345236" imageData:UIImageJPEGRepresentation([UIImage imageNamed:@"2.jpg"], 0.3)],
                            [DemoModel  modelWithName:@"Qiao" friendId:@"45642433" imageData:UIImageJPEGRepresentation([UIImage imageNamed:@"3.jpg"], 0.3)],
                            [DemoModel  modelWithName:@"Yu" friendId:@"6356347345" imageData:UIImageJPEGRepresentation([UIImage imageNamed:@"4.jpg"], 0.3)],
                            [DemoModel  modelWithName:@"Feng" friendId:@"4764536456" imageData:UIImageJPEGRepresentation([UIImage imageNamed:@"5.jpg"], 0.3)],
                            [DemoModel  modelWithName:@"Chen" friendId:@"734563465" imageData:UIImageJPEGRepresentation([UIImage imageNamed:@"6.jpg"], 0.3)],
                            [DemoModel  modelWithName:@"Ru" friendId:@"534535345" imageData:UIImageJPEGRepresentation([UIImage imageNamed:@"7.jpg"], 0.3)],
                            [DemoModel  modelWithName:@"Good" friendId:@"34534573457" imageData:UIImageJPEGRepresentation([UIImage imageNamed:@"8.jpg"], 0.3)] ];
    return testModels;
}
@end
