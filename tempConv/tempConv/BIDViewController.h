//
//  BIDViewController.h
//  tempConv
//
//  Created by malena mesarina on 10/9/13.
//  Copyright (c) 2013 malena mesarina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *fahrenheitField;
@property (nonatomic, strong) IBOutlet UITextField *celciusField;
//@property (nonatomic, strong) IBOutlet UIButton *convert;

- (IBAction)convert:(UIButton *)sender;

@end
