//
//  ViewController.m
//  Example
//
//  Created by Fernando Bunn on 10/25/15.
//

#import "ViewController.h"
#import "BouncingView.h"

@interface ViewController ()

@property (nonatomic, strong) BouncingView *bouncingView;

@end

@implementation ViewController

#pragma mark - Initialization Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.bouncingView = [[BouncingView alloc] initWithFrame:CGRectZero];
    self.bouncingView.image = [UIImage imageNamed:@"hexley"];
    self.bouncingView.friction = 2.0;
    [self.view addSubview:self.bouncingView];
}


#pragma mark - Layout Methods

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSInteger size = 150;
    self.bouncingView.frame = CGRectMake(0, 0, size, size);
    self.bouncingView.center = self.view.center;
    [self.bouncingView setNeedsLayout];
}

@end
