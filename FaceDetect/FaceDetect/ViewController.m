//
//  ViewController.m
//  FaceDetect
//
//  Created by wkcloveYang on 2019/10/9.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "ViewController.h"
#import "WKCFaceDetectManager.h"
#import "WKCFaceDetectDrawImageView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage * image = [UIImage imageNamed:@"1.jpg"];
    
    WKCFaceDetectDrawImageView * drawView = [[WKCFaceDetectDrawImageView alloc] initWithFrame:self.view.bounds];
    drawView.shouldDrawedRemove = NO;
    [self.view addSubview:drawView];
    
    drawView.image = image;
    
}


@end
