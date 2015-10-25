
//
//  Created by Fernando Bunn
//

@import UIKit;

@interface FCBBouncingView : UIView

/*!
 @brief Fricton value, the higher it is, the more difficult it is to drag. 
 No friction value = 1.0
 Default value = 1.5
 */
@property (nonatomic, assign) CGFloat friction;


#pragma mark - UIAttachmentBehavior properties

/*!
 @brief The distance, in points, between the two attachment points of the attachment behavior. 
 Default value = 1.0
 */
@property (readwrite, nonatomic) CGFloat length;

/*!
 @brief The amount of damping to apply to the attachment behavior.
 Default value = 0.2
 */
@property (readwrite, nonatomic) CGFloat damping;

/*!
 @brief The frequency in Hertz of oscillation for the attachment behavior.
 Default value = 2.5
 */
@property (readwrite, nonatomic) CGFloat frequency;

@end
