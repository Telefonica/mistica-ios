////
////  TMFloatingTooltipView.h
////  Mistica
////
////  Created by Sergio Padrino on 10/31/13.
////  Copyright (c) 2013 Tuenti Technologies S.L. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//typedef void (^TMFloatingTooltipViewAction)(void);
//
//typedef NS_ENUM(NSUInteger, TMFloatingTooltipViewTipDirection)
//{
//    TMFloatingTooltipViewTipDirectionAutomatic = 0,
//	TMFloatingTooltipViewTipDirectionUp,
//	TMFloatingTooltipViewTipDirectionDown,
//};
//
//#pragma mark - TMFloatingTooltipViewConfiguration definition
//
//@interface TMFloatingTooltipViewConfiguration : NSObject
//
//@property (nonatomic, readonly) UIFont *titleFont;
//@property (nonatomic, readonly) UIFont *messageFont;
//@property (nonatomic, readonly) UIColor *textColor;
//@property (nonatomic, readonly) UIColor *backgroundColor;
//@property (nonatomic, readonly) CGFloat cornerRadius;
//@property (nonatomic, readonly) UIImage *closeButtonImage;
//
//@end
//
//#pragma mark - TMFloatingTooltipView definition
//
//@interface TMFloatingTooltipView : UIView
//
//- (void)setConfiguration:(TMFloatingTooltipViewConfiguration *)configuration;
//- (void)setPreferredTipDirection:(TMFloatingTooltipViewTipDirection)preferredTipDirection;
//
//- (void)setUpTapAction:(nullable TMFloatingTooltipViewAction)action;
//- (void)setUpCloseAction:(nullable TMFloatingTooltipViewAction)action;
//
//- (void)showTitle:(nullable NSString *)title message:(nullable NSString *)title pointingAtView:(UIView *)targetView inView:(UIView *)containerView animated:(BOOL)animated;
//- (void)dismissAnimated:(BOOL)animated;
//
//@end
//
//NS_ASSUME_NONNULL_END
