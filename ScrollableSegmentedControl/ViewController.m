//
//  ViewController.m
//  ScrollableSegmentedControl
//
//  Created by Pulkit Rohilla on 17/06/16.
//  Copyright © 2016 PulkitRohilla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintSegmentedControlWidth;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController
const float padding = 20;
const float margin = 8;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews{

    [self updateSegmentedControlWidth];
}

-(void)updateSegmentedControlWidth{
    
    NSString *longestString;
    UILabel *lblSegmentControl;
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    
    NSInteger segments = self.segmentedControl.numberOfSegments;
    
    for (int index = 0; index < segments; index++) {
        
        NSString *title = [self.segmentedControl titleForSegmentAtIndex:index];
        
        if (title.length > longestString.length) {
            
            longestString = title;
        }
        
    }
    
    // get font for segment title label
    for (UILabel *label in self.segmentedControl.subviews) {
        
        if ([label isKindOfClass:[UILabel class]]) {
            
            lblSegmentControl = label;
            
            break;
        }
    }
    
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          lblSegmentControl.font, NSFontAttributeName,
                                          nil];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:longestString attributes:attributesDictionary];
    
    CGFloat segmentWidth = string.size.width + 2*padding;
    
    CGFloat barWidth = segmentWidth*segments;
    
    if (viewWidth > barWidth) {
        
        barWidth = viewWidth - 2*margin;
    }
    
    [self.constraintSegmentedControlWidth setConstant:barWidth];
}

@end
