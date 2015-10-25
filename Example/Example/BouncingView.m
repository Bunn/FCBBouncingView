//
//  BouncingView.m
//  Example
//
//  Created by Fernando Bunn on 10/25/15.
//

#import "BouncingView.h"


@interface BouncingView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation BouncingView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.clipsToBounds = YES;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.imageView];
    
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 5.0f;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    self.layer.cornerRadius = self.frame.size.width / 2;
}


#pragma mark - Public Methods

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (UIImage *)image {
    return self.imageView.image;
}
@end
