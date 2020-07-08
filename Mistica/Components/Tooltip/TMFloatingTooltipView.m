////
////  TMFloatingTooltipView.m
////  Mistica
////
////  Created by Sergio Padrino on 10/31/13.
////  Copyright (c) 2013 Tuenti Technologies S.L. All rights reserved.
////
//
//#import "TMFloatingTooltipView.h"
//
//#import <QuartzCore/QuartzCore.h>
//#import "UIView+TUGestureRecognizers.h"
//
//#import <CommonUIKit/CommonUIKit-Swift.h>
//
//static CGFloat const kTipHeight = 7.0f;
//static CGFloat const kGapBetweenTipAndTarget = 5.0f;
//static CGFloat const kGapBetweenTextAndCloseButton = 0.0f;
//static CGFloat const kGapBetweenTitleAndMessage = 8.0f;
//static CGFloat const kSidePadding = 18.0f;
//static CGFloat const kCloseButtonSize = 24.0f;
//static CGFloat const kDefaultCornerRadius = 3.0f;
//static CGFloat const kTextMarginLeft = 16.0f;
//static CGFloat const kTextMarginRight = 8.0f;
//static CGFloat const kVerticalTextMargin = 15.0f;
//static CGFloat const kCloseButtonTopMargin = 18.0f;
//static CGFloat const kCloseButtonLeftMargin = 8.0f;
//static CGFloat const kMaximumWidth = 320.0f;
//static CGFloat const kAnimationAppearanceOffset = 5.0f;
//static CGFloat const kShadowOpacity = 0.3f;
//static CGFloat const kShadowRadius = 6.0;
//static CGSize const kShadowOffset = {0.0, 3.0};
//
//#pragma mark - TMFloatingTooltipView implementation
//
//@implementation TMFloatingTooltipViewConfiguration
//
//@end
//
//#pragma mark - TMFloatingTooltipView class extension
//
//@interface TMFloatingTooltipView ()
//
//@property (nonatomic, copy) NSString *message;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic) TMFloatingTooltipViewTipDirection preferredTipDirection;
//
//@property (nonatomic) UIStackView *stackView;
//@property (nonatomic) CAShapeLayer *bubbleShapeLayer;
//@property (nonatomic) UILabel *messageLabel;
//@property (nonatomic) UILabel *titleLabel;
//@property (nonatomic) UIImageView *closeButtonImageView;
//@property (nonatomic) CGSize bubbleSize;
//@property (nonatomic) TMFloatingTooltipViewTipDirection tipDirection;
//@property (nonatomic) CGPoint targetPoint;
//
//@property (nonatomic) CGFloat cornerRadius;
//@property (nonatomic) BOOL closeButtonIsShown;
//@property (nonatomic) NSLayoutConstraint *stackViewCenterYConstraint;
//
//@end
//
//#pragma mark - TMFloatingTooltipView implementation
//
//@implementation TMFloatingTooltipView
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//	if ((self = [super initWithFrame:frame]))
//	{
//		self.opaque = NO;
//
//		[self configureBubbleShapeLayer];
//		[self configureTitleLabel];
//		[self configureMessageLabel];
//
//		self.backgroundColor = [UIColor clearColor];
//		self.preferredTipDirection = TMFloatingTooltipViewTipDirectionAutomatic;
//		self.closeButtonIsShown = YES;
//		[self showCloseButtonWithImage:UIImage.closeButtonBlackIcon];
//	}
//	return self;
//}
//
//- (void)setUpTapAction:(TMFloatingTooltipViewAction)action
//{
//	if (action == nil) {
//		return;
//	}
//	[self tu_tapGestureRecognizerWithHandler:^(UITapGestureRecognizer *tapGestureRecognizer) {
//		action();
//	}];
//}
//
//- (void)setUpCloseAction:(TMFloatingTooltipViewAction)action
//{
//	if (action == nil) {
//		return;
//	}
//	self.closeButtonImageView.userInteractionEnabled = YES;
//	[self.closeButtonImageView tu_tapGestureRecognizerWithHandler:^(UITapGestureRecognizer *tapGestureRecognizer) {
//		action();
//	}];
//}
//
//- (void)configureBubbleShapeLayer
//{
//	_bubbleShapeLayer = [[CAShapeLayer alloc] init];
//	_bubbleShapeLayer.fillColor = [UIColor backgroundColor].CGColor;
//	_cornerRadius = kDefaultCornerRadius;
//	[self.layer addSublayer:_bubbleShapeLayer];
//	
//	_closeButtonImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
//	[self addSubview:_closeButtonImageView constraints:@[[_closeButtonImageView.widthAnchor constraintEqualToConstant:kCloseButtonSize],
//														 [_closeButtonImageView.heightAnchor constraintEqualToConstant:kCloseButtonSize],
//														 [_closeButtonImageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:kCloseButtonTopMargin],
//														 [_closeButtonImageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-(kSidePadding + kTextMarginRight)]
//														 ]];
//
//	_stackView = [[UIStackView alloc] init];
//	_stackView.backgroundColor = [UIColor clearColor];
//	_stackView.axis = UILayoutConstraintAxisVertical;
//	_stackView.alignment = UIStackViewAlignmentLeading;
//
//	_stackViewCenterYConstraint = [_stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:(kTipHeight/2)];
//	[self addSubview:_stackView
//		 constraints:@[_stackViewCenterYConstraint,
//					   [_stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:kSidePadding + kTextMarginLeft],
//					   [_stackView.trailingAnchor constraintEqualToAnchor:self.closeButtonImageView.leadingAnchor constant:-kGapBetweenTextAndCloseButton]
//					   ]];
//}
//
//- (void)configureMessageLabel
//{
//	_messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//	_messageLabel.font = [UIFont sub1Font];
//	_messageLabel.backgroundColor = [UIColor clearColor];
//	_messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
//	_messageLabel.textAlignment = NSTextAlignmentLeft;
//	_messageLabel.textColor = [UIColor textPrimaryColor];
//	_messageLabel.numberOfLines = 0;
//
//	[_stackView addArrangedSubview:_messageLabel];
//}
//
//- (void)configureTitleLabel
//{
//	_titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//	_titleLabel.font = [UIFont body2Font];
//	_titleLabel.backgroundColor = [UIColor clearColor];
//	_titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
//	_titleLabel.textAlignment = NSTextAlignmentLeft;
//	_titleLabel.textColor = [UIColor textPrimaryColor];
//	_titleLabel.numberOfLines = 0;
//
//	[_stackView addArrangedSubview:_titleLabel];
//}
//
//- (void)setConfiguration:(TMFloatingTooltipViewConfiguration *)configuration
//{
//	_bubbleShapeLayer.fillColor = configuration.backgroundColor.CGColor;
//	_titleLabel.font = configuration.titleFont;
//	_titleLabel.textColor = configuration.textColor;
//	_messageLabel.font = configuration.messageFont;
//	_messageLabel.textColor = configuration.textColor;
//	_cornerRadius = configuration.cornerRadius;
//
//	if (configuration.closeButtonImage)
//	{
//		_closeButtonIsShown = YES;
//		[self showCloseButtonWithImage:configuration.closeButtonImage];
//	}
//}
//
//- (void)showCloseButtonWithImage:(UIImage *)image
//{
//	[_closeButtonImageView setImage:image];
//	_closeButtonImageView.contentMode = UIViewContentModeCenter;
//	_closeButtonImageView.backgroundColor = [UIColor clearColor];
//	_closeButtonImageView.accessibilityIdentifier = @"Close";
//}
//
//- (void)setMessage:(NSString *)message
//{
//	if (_message != message)
//	{
//		_message = [message copy];
//		self.messageLabel.text = message;
//	}
//}
//
//- (void)setTitle:(NSString *)title
//{
//	if (_title != title)
//	{
//		_title = [title copy];
//		self.titleLabel.text = title;
//	}
//}
//
//- (void)dismissAnimated:(BOOL)animated
//{
//	void (^completionBlock)(BOOL) = ^(BOOL finished) {
//		if (finished)
//		{
//			[self removeFromSuperview];
//		}
//	};
//
//	if (animated)
//	{
//		CGRect endFrame = CGRectOffset(self.frame, 0, [self initialAppearanceYOffset]);
//
//		[UIView animateWithDuration:UIView.defaultAnimationDuration
//							  delay:0.f
//							options:UIViewAnimationOptionCurveEaseInOut
//						 animations:^{
//							 self.alpha = 0.0;
//							 self.frame = endFrame;
//						 }
//						 completion:completionBlock];
//	}
//	else
//	{
//		completionBlock(YES);
//	}
//}
//
//- (CGFloat)initialAppearanceYOffset
//{
//	return (self.tipDirection == TMFloatingTooltipViewTipDirectionUp
//			? kAnimationAppearanceOffset
//			: -kAnimationAppearanceOffset);
//}
//
//- (void)showTitle:(nullable NSString *)title message:(NSString *)message pointingAtView:(UIView *)targetView inView:(UIView *)containerView animated:(BOOL)animated
//{
//	if (targetView.hidden) return;
//	if (targetView.alpha == 0.) return;
//
//	[containerView addSubview:self];
//
//	self.message = message;
//	self.title = title;
//
//	[self updateBubbleSizeWithContainerWidth:containerView.frameWidth];
//
//	CGRect finalFrame = CGRectZero;
//	[self updateTipWithTargetView:targetView
//					containerView:containerView
//					outFinalFrame:&finalFrame];
//
//	[self prepareForDisplay];
//
//	[self showWithFinalFrame:finalFrame animated:animated];
//}
//
//- (void)updateTipWithTargetView:(UIView *)targetView containerView:(UIView *)containerView outFinalFrame:(CGRect *)outFinalFrame
//{
//	CGFloat tipY = 0.f;
//	_tipDirection = [self tipDirectionWithTargetView:targetView
//									   containerView:containerView
//											 outTipY:&tipY];
//
//	_targetPoint = [self targetTipPointWithTipY:tipY
//									 targetView:targetView
//								  containerView:containerView
//								  outFinalFrame:outFinalFrame];
//}
//
//- (void)updateBubbleSizeWithContainerWidth:(CGFloat)containerWidth
//{
//	// Size of rounded rect (the bubble without the tip)
//	CGFloat maximumContentWidth = [self maximumContentWidthWithContainerWidth:containerWidth];
//
//	CGFloat maximumTextWidth = maximumContentWidth;
//
//	CGFloat extraWidthForCloseButton = kCloseButtonSize + kGapBetweenTextAndCloseButton;
//
//	if (_closeButtonIsShown)
//	{
//		maximumTextWidth -= extraWidthForCloseButton;
//	}
//
//	CGSize titleSize = [self titleSizeWithMaximumContentWidth:maximumTextWidth];
//	CGSize messageSize = [self messageSizeWithMaximumContentWidth:maximumTextWidth];
//
//	CGFloat bubbleWidth = kTextMarginLeft + MAX(titleSize.width, messageSize.width) + kTextMarginRight + kCloseButtonLeftMargin;
//	CGFloat bubbleHeight = kVerticalTextMargin * 2.f + titleSize.height + messageSize.height;
//	
//	if (_title)
//	{
//		bubbleHeight += kGapBetweenTitleAndMessage;
//		_stackView.spacing = kGapBetweenTitleAndMessage;
//	}
//
//	if (_closeButtonIsShown)
//	{
//		bubbleWidth += extraWidthForCloseButton;
//		bubbleHeight = MAX(bubbleHeight, _closeButtonImageView.frameHeight + kVerticalTextMargin * 2.f - kTipHeight);
//	}
//
//	_bubbleSize = CGSizeMake((CGFloat)ceil(bubbleWidth), (CGFloat)ceil(bubbleHeight));
//}
//
//- (CGFloat)maximumContentWidthWithContainerWidth:(CGFloat)containerWidth
//{
//	return MIN(containerWidth - kTextMarginLeft - kTextMarginRight - kSidePadding * 2.f, kMaximumWidth);
//}
//
//- (CGSize)titleSizeWithMaximumContentWidth:(CGFloat)maximumContentWidth
//{
//	return [self.title boundingRectWithSize:CGSizeMake(maximumContentWidth, CGFLOAT_MAX)
//									options:NSStringDrawingUsesLineFragmentOrigin
//								 attributes:@{NSFontAttributeName: self.titleLabel.font}
//									context:nil].size;
//}
//
//- (CGSize)messageSizeWithMaximumContentWidth:(CGFloat)maximumContentWidth
//{
//	return [self.message boundingRectWithSize:CGSizeMake(maximumContentWidth, CGFLOAT_MAX)
//									  options:NSStringDrawingUsesLineFragmentOrigin
//								   attributes:@{NSFontAttributeName: self.messageLabel.font}
//									  context:nil].size;
//}
//
//- (CGPoint)targetTipPointWithTipY:(CGFloat)tipY
//					   targetView:(UIView *)targetView
//					containerView:(UIView *)containerView
//					outFinalFrame:(CGRect *)outFinalFrame
//{
//	CGFloat containerWidth = containerView.frameWidth;
//	CGPoint targetCenterInContainerView = [targetView.superview convertPoint:targetView.center toView:containerView];
//
//	CGFloat targetCenterX = targetCenterInContainerView.x;
//
//	// Try showing the bubble center-aligned with the target
//	CGFloat bubbleX = targetCenterX - (CGFloat)round(_bubbleSize.width / 2.f);
//
//	// Ensure separation with container borders
//	if (bubbleX < kSidePadding)
//	{
//		bubbleX = kSidePadding;
//	}
//	if (bubbleX + _bubbleSize.width + kSidePadding > containerWidth)
//	{
//		bubbleX = containerWidth - _bubbleSize.width - kSidePadding;
//	}
//
//	// Make sure the tip doesn't overlap with the corner radius to avoid weird effects
//	if (targetCenterX - kTipHeight < bubbleX + _cornerRadius)
//	{
//		targetCenterX = bubbleX + _cornerRadius + kTipHeight;
//	}
//	if (targetCenterX + kTipHeight > bubbleX + _bubbleSize.width - _cornerRadius)
//	{
//		targetCenterX = bubbleX + _bubbleSize.width - _cornerRadius - kTipHeight;
//	}
//
//	CGFloat fullHeight = _bubbleSize.height + kTipHeight;
//	CGFloat bubbleY;
//	CGPoint targetTipPoint;
//
//	if (_tipDirection == TMFloatingTooltipViewTipDirectionUp)
//	{
//		bubbleY = kGapBetweenTipAndTarget + tipY;
//		targetTipPoint = CGPointMake(targetCenterX - bubbleX + kSidePadding, 0);
//		_stackViewCenterYConstraint.constant = kTipHeight/2;
//	}
//	else
//	{
//		bubbleY = tipY - fullHeight - kGapBetweenTipAndTarget;
//		targetTipPoint = CGPointMake(targetCenterX - bubbleX + kSidePadding, fullHeight);
//		_stackViewCenterYConstraint.constant = -(kTipHeight/2);
//	}
//
//	*outFinalFrame = CGRectMake(bubbleX - kSidePadding,
//								bubbleY,
//								_bubbleSize.width + kSidePadding * 2.f,
//								fullHeight);
//
//	return targetTipPoint;
//}
//
//- (TMFloatingTooltipViewTipDirection)tipDirectionWithTargetView:(UIView *)targetView
//												  containerView:(UIView *)containerView
//														outTipY:(CGFloat *)outTipY
//{
//	UIView *superview = containerView.superview;
//	if ([superview isKindOfClass:[UIWindow class]])
//		superview = containerView;
//
//	BOOL isIntoScrollView = [containerView isKindOfClass:[UIScrollView class]];
//	CGPoint targetRelativeOrigin = [targetView.superview convertPoint:targetView.frameOrigin toView:superview];
//	CGPoint containerRelativeOrigin = [superview convertPoint:containerView.frameOrigin toView:superview];
//
//	CGFloat tipY;	// Y coordinate of pointer target (within containerView)
//	TMFloatingTooltipViewTipDirection tipDirection = self.preferredTipDirection;
//
//	if (targetRelativeOrigin.y + targetView.frameHeight < containerRelativeOrigin.y && !isIntoScrollView)
//	{
//		tipY = 0.0;
//		tipDirection = TMFloatingTooltipViewTipDirectionUp;
//	}
//	else if (targetRelativeOrigin.y > containerRelativeOrigin.y + containerView.frameHeight)
//	{
//		tipY = containerView.frameHeight;
//		tipDirection = TMFloatingTooltipViewTipDirectionDown;
//	}
//	else
//	{
//		CGPoint targetOriginInContainer = [targetView convertPoint:CGPointZero toView:containerView];
//		CGFloat sizeBelow = containerView.frameHeight - targetOriginInContainer.y;
//		if (tipDirection == TMFloatingTooltipViewTipDirectionAutomatic)
//		{
//			if (sizeBelow > targetOriginInContainer.y)
//			{
//				tipY = targetOriginInContainer.y + targetView.frameHeight;
//				tipDirection = TMFloatingTooltipViewTipDirectionUp;
//			}
//			else
//			{
//				tipY = targetOriginInContainer.y;
//				tipDirection = TMFloatingTooltipViewTipDirectionDown;
//			}
//		}
//		else if (tipDirection == TMFloatingTooltipViewTipDirectionDown)
//		{
//			tipY = targetOriginInContainer.y;
//		}
//		else // Up
//		{
//			tipY = targetOriginInContainer.y + targetView.frameHeight;
//		}
//	}
//
//	*outTipY = tipY;
//	return tipDirection;
//}
//
//- (void)prepareForDisplay
//{
//	[self updateBubbleShapePath];
//
//	[self addShadow];
//}
//
//- (void)addShadow
//{
//	[self.layer setCornerRadius:self.cornerRadius];
//	[self.layer setShadowColor:[UIColor textPrimaryColor].CGColor];
//	[self.layer setShadowOpacity:kShadowOpacity];
//	[self.layer setShadowRadius:kShadowRadius];
//	[self.layer setShadowOffset:kShadowOffset];
//}
//
//- (CGRect)bubbleFrame
//{
//	CGFloat bubbleFrameY;
//
//	if (_tipDirection == TMFloatingTooltipViewTipDirectionUp)
//	{
//		bubbleFrameY = _targetPoint.y + kTipHeight;
//	}
//	else
//	{
//		bubbleFrameY = _targetPoint.y - kTipHeight - _bubbleSize.height;
//	}
//
//	return CGRectMake(kSidePadding, bubbleFrameY, _bubbleSize.width, _bubbleSize.height);
//}
//
//- (void)updateBubbleShapePath
//{
//	CGPathRef bubblePath = [self newBubblePath];
//	self.bubbleShapeLayer.path = bubblePath;
//	CGPathRelease(bubblePath);
//}
//
//- (CGPathRef)newBubblePath
//{
//	CGRect bubbleRect = [self bubbleFrame];
//
//	CGMutablePathRef bubblePath = CGPathCreateMutable();
//
//	if (_tipDirection == TMFloatingTooltipViewTipDirectionUp)
//	{
//		CGPathMoveToPoint(bubblePath, NULL, _targetPoint.x, _targetPoint.y);
//		CGPathAddLineToPoint(bubblePath, NULL, _targetPoint.x + kTipHeight, _targetPoint.y + kTipHeight);
//
//		CGPathAddArcToPoint(bubblePath, NULL,
//							bubbleRect.origin.x + bubbleRect.size.width, bubbleRect.origin.y,
//							bubbleRect.origin.x + bubbleRect.size.width, bubbleRect.origin.y + bubbleRect.size.height,
//							_cornerRadius);
//		CGPathAddArcToPoint(bubblePath, NULL,
//							bubbleRect.origin.x + bubbleRect.size.width, bubbleRect.origin.y + bubbleRect.size.height,
//							bubbleRect.origin.x, bubbleRect.origin.y + bubbleRect.size.height,
//							_cornerRadius);
//		CGPathAddArcToPoint(bubblePath, NULL,
//							bubbleRect.origin.x, bubbleRect.origin.y + bubbleRect.size.height,
//							bubbleRect.origin.x, bubbleRect.origin.y,
//							_cornerRadius);
//		CGPathAddArcToPoint(bubblePath, NULL,
//							bubbleRect.origin.x, bubbleRect.origin.y,
//							bubbleRect.origin.x + bubbleRect.size.width, bubbleRect.origin.y,
//							_cornerRadius);
//		CGPathAddLineToPoint(bubblePath, NULL, _targetPoint.x - kTipHeight, _targetPoint.y + kTipHeight);
//	}
//	else
//	{
//		CGPathMoveToPoint(bubblePath, NULL, _targetPoint.x, _targetPoint.y);
//		CGPathAddLineToPoint(bubblePath, NULL, _targetPoint.x - kTipHeight, _targetPoint.y - kTipHeight);
//
//		CGPathAddArcToPoint(bubblePath, NULL,
//							bubbleRect.origin.x, bubbleRect.origin.y + bubbleRect.size.height,
//							bubbleRect.origin.x, bubbleRect.origin.y,
//							_cornerRadius);
//		CGPathAddArcToPoint(bubblePath, NULL,
//							bubbleRect.origin.x, bubbleRect.origin.y,
//							bubbleRect.origin.x + bubbleRect.size.width, bubbleRect.origin.y,
//							_cornerRadius);
//		CGPathAddArcToPoint(bubblePath, NULL,
//							bubbleRect.origin.x + bubbleRect.size.width, bubbleRect.origin.y,
//							bubbleRect.origin.x + bubbleRect.size.width, bubbleRect.origin.y + bubbleRect.size.height,
//							_cornerRadius);
//		CGPathAddArcToPoint(bubblePath, NULL,
//							bubbleRect.origin.x + bubbleRect.size.width, bubbleRect.origin.y + bubbleRect.size.height,
//							bubbleRect.origin.x, bubbleRect.origin.y + bubbleRect.size.height,
//							_cornerRadius);
//		CGPathAddLineToPoint(bubblePath, NULL, _targetPoint.x + kTipHeight, _targetPoint.y - kTipHeight);
//	}
//
//	CGPathCloseSubpath(bubblePath);
//
//	return bubblePath;
//}
//
//- (void)showWithFinalFrame:(CGRect)finalFrame animated:(BOOL)animated
//{
//	if (animated)
//	{
//		self.alpha = 0.0;
//		CGRect startFrame = CGRectOffset(finalFrame, 0, [self initialAppearanceYOffset]);
//		self.frame = startFrame;
//
//		[UIView animateWithDuration:0.25f
//						 animations:^{
//							 self.alpha = 1.0;
//							 self.frame = finalFrame;
//						 }];
//	}
//	else
//	{
//		self.frame = finalFrame;
//	}
//}
//
//@end
