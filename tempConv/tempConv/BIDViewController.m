//
//  BIDViewController.m
//  tempConv
//
//  Created by malena mesarina on 10/9/13.
//  Copyright (c) 2013 malena mesarina. All rights reserved.
//

#import "BIDViewController.h"

// class extensions
@interface BIDViewController ()

- (void) updateValues:(UITextField*) textField;
- (void) onDoneButton;
- (void) convert: (UIButton*)sender;


@end

@implementation BIDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temp Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Setup a delegate for your fields;
    self.fahrenheitField.text = @"";
    self.celciusField.text = @"";
    self.fahrenheitField.delegate = self;
    self.celciusField.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - UITextField delegates
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    if (textField.tag == 1) {
        self.fahrenheitField.text = @"";
    }
    if (textField.tag == 2) {
        self.celciusField.text = @"";
    }
    
    
    
  return YES;
}


//-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    // when finishing editing get rid of Done button
  //  self.navigationItem.rightBarButtonItem = nil;
 //   [textField resignFirstResponder];
    
    
 //   return YES;
   
//}

-(void) updateValues: (UITextField *) textField {
    
    float f;
    float c;
    if (textField.tag == 1)
    {
        c =[self.celciusField.text floatValue];
        f = (c*9/5)+32;
        self.fahrenheitField.text= [NSString stringWithFormat:@"%f",f];
    } else {
        f = [self.fahrenheitField.text floatValue];
        c = (f-32)*(5.0/9.0);
        self.celciusField.text = [NSString stringWithFormat:@"%f", c];
        
    }
    

    
}
                                               
                                               

-(void)onDoneButton{
    
    self.celciusField.text = @"";
    self.fahrenheitField.text = @"";
    self.navigationItem.rightBarButtonItem = nil;
        
}



-(void) convert: (UIButton *) sender {
    
    float f;
    float c;
    //dismiss the keyboard
    [self.fahrenheitField resignFirstResponder];
    [self.celciusField resignFirstResponder];
    NSString *fString = self.fahrenheitField.text;
    NSString *cString = self.celciusField.text;
    if ( !([fString isEqualToString:@""])){
        
        f = [self.fahrenheitField.text floatValue];
        c = (f-32)*(5.0/9.0);
        self.celciusField.text = [NSString stringWithFormat:@"%f", c];
        
    }

    if ( !([cString isEqualToString:@""])) {
        c =[self.celciusField.text floatValue];
        f = (c*9/5)+32;
        self.fahrenheitField.text= [NSString stringWithFormat:@"%f",f];
        
    }
    
    
    

    
}



@end
