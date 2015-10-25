
//
//  Created by Fernando Bunn
//

#import "FCBBouncingView.h"

#define DEFAULT_FRICTION 1.5
#define DEFAULT_LENGTH 1.0
#define DEFAULT_DAMPING 0.2
#define DEFAULT_FREQUENCY 2.5

@interface FCBBouncingView()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic, assign) CGPoint originCenter;
@property (nonatomic, assign) CGPoint startCenter;

@end


@implementation FCBBouncingView


#pragma mark - Initialization Methods

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:panRecognizer];
    
    self.attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self attachedToAnchor:self.center];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.superview];
    
    self.friction = DEFAULT_FRICTION;
    self.length = DEFAULT_LENGTH;
    self.damping = DEFAULT_DAMPING;
    self.frequency = DEFAULT_FREQUENCY;
}


#pragma mark - Layout Methods

- (void)layoutSubviews {
    [super layoutSubviews];
    self.originCenter = self.center;
    [self.animator removeAllBehaviors];
}


#pragma mark - Gesture Recognizer Methods

- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.startCenter = [gesture locationInView:gesture.view.superview];
        [self.animator removeAllBehaviors];
        
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint newPoint = [gesture locationInView:gesture.view.superview];
        CGFloat newY = ((newPoint.y - self.startCenter.y) / self.friction);
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + newY, self.frame.size.width, self.frame.size.height);
        self.startCenter = newPoint;

    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        self.attachmentBehavior.anchorPoint = self.originCenter;
        self.attachmentBehavior.frequency = self.frequency;
        self.attachmentBehavior.length = self.length;
        self.attachmentBehavior.damping = self.damping;
        [self.animator addBehavior:self.attachmentBehavior];
    }
}

@end
