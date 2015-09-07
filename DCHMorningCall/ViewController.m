//
//  ViewController.m
//  DCHMorningCall
//
//  Created by Derek Chen on 9/7/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "ViewController.h"
#import <JVFloatLabeledTextField.h>
#import <Tourbillon/DCHTourbillon.h>
#import "DCHMorningCallMacro.h"
#import <Masonry.h>
#import <BlocksKit.h>
#import <BlocksKit+UIKit.h>

@interface ViewController ()

@property (nonatomic, strong) UILabel *morningCallLabel;
@property (nonatomic, strong) JVFloatLabeledTextField *morningCallHourTextField;
@property (nonatomic, strong) JVFloatLabeledTextField *morningCallMinuteTextField;
@property (nonatomic, strong) UIImageView *morningCallImgView;
@property (nonatomic, strong) UISwitch *morningCallSwitch;

@property (nonatomic, strong) UILabel *siestaCallLabel;
@property (nonatomic, strong) JVFloatLabeledTextField *siestaHourTextField;
@property (nonatomic, strong) JVFloatLabeledTextField *siestaMinuteTextField;
@property (nonatomic, strong) UIImageView *siestaCallImgView;
@property (nonatomic, strong) UISwitch *siestaSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (DCH_IsEmpty(self.morningCallLabel)) {
        self.morningCallLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.morningCallLabel.textColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallLabel.font = [UIFont boldSystemFontOfSize:titleFontSize];
        self.morningCallLabel.text = @"Morning Call";
        [self.view addSubview:self.morningCallLabel];
    }
    if (DCH_IsEmpty(self.morningCallHourTextField)) {
        self.morningCallHourTextField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        self.morningCallHourTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.morningCallHourTextField.floatingLabelTextColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallHourTextField.floatingLabelActiveTextColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallHourTextField.font = [UIFont systemFontOfSize:textFieldFontSize];
        [self.morningCallHourTextField setPlaceholder:@"Morning call hour" floatingTitle:@"Morning call hour"];
        [self.view addSubview:self.morningCallHourTextField];
    }
    if (DCH_IsEmpty(self.morningCallMinuteTextField)) {
        self.morningCallMinuteTextField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        self.morningCallMinuteTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.morningCallMinuteTextField.floatingLabelTextColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallMinuteTextField.floatingLabelActiveTextColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallMinuteTextField.font = [UIFont systemFontOfSize:textFieldFontSize];
        [self.morningCallMinuteTextField setPlaceholder:@"Morning call minute" floatingTitle:@"Morning call minute"];
        [self.view addSubview:self.morningCallMinuteTextField];
    }
    if (DCH_IsEmpty(self.morningCallImgView)) {
        self.morningCallImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 49)];
        [self.view addSubview:self.morningCallImgView];
    }
    if (DCH_IsEmpty(self.morningCallSwitch)) {
        self.morningCallSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        self.morningCallSwitch.onTintColor = clr_DCHMorningCall_MainThemeColor;
        
        [self.morningCallSwitch bk_addEventHandler:^(id sender) {
            if (self.morningCallSwitch.on) {
                self.morningCallImgView.image = [UIImage imageNamed:@"bulb_L"];
            } else {
                self.morningCallImgView.image = [UIImage imageNamed:@"bulb_F"];
            }
        } forControlEvents:UIControlEventValueChanged];
        
        [self.view addSubview:self.morningCallSwitch];
    }
    
    if (DCH_IsEmpty(self.siestaCallLabel)) {
        self.siestaCallLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.siestaCallLabel.textColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaCallLabel.font = [UIFont systemFontOfSize:titleFontSize];
        self.siestaCallLabel.text = @"Siesta";
        [self.view addSubview:self.siestaCallLabel];
    }
    if (DCH_IsEmpty(self.siestaHourTextField)) {
        self.siestaHourTextField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        self.siestaHourTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.siestaHourTextField.floatingLabelTextColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaHourTextField.floatingLabelActiveTextColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaHourTextField.font = [UIFont systemFontOfSize:textFieldFontSize];
        [self.siestaHourTextField setPlaceholder:@"Siesta hour" floatingTitle:@"Siesta hour"];
        [self.view addSubview:self.siestaHourTextField];
    }
    if (DCH_IsEmpty(self.siestaMinuteTextField)) {
        self.siestaMinuteTextField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        self.siestaMinuteTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.siestaMinuteTextField.floatingLabelTextColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaMinuteTextField.floatingLabelActiveTextColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaMinuteTextField.font = [UIFont systemFontOfSize:textFieldFontSize];
        [self.siestaMinuteTextField setPlaceholder:@"Siesta minute" floatingTitle:@"Siesta minute"];
        [self.view addSubview:self.siestaMinuteTextField];
    }
    if (DCH_IsEmpty(self.siestaCallImgView)) {
        self.siestaCallImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 49)];
        [self.view addSubview:self.siestaCallImgView];
    }
    if (DCH_IsEmpty(self.siestaSwitch)) {
        self.siestaSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        self.siestaSwitch.onTintColor = clr_DCHMorningCall_MainThemeColor;
        
        [self.siestaSwitch bk_addEventHandler:^(id sender) {
            if (self.siestaSwitch.on) {
                self.siestaCallImgView.image = [UIImage imageNamed:@"bulb_L"];
            } else {
                self.siestaCallImgView.image = [UIImage imageNamed:@"bulb_F"];
            }
        } forControlEvents:UIControlEventValueChanged];
        
        [self.view addSubview:self.siestaSwitch];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    do {
        [super viewWillAppear:animated];
        
        UIView *superview = self.view;
        
        [self.morningCallLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuide).offset(lPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 4);
        }];
        
        
        [self.morningCallHourTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.morningCallLabel.mas_bottom).offset(sPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 4);
        }];
        
        
        [self.morningCallMinuteTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.morningCallHourTextField.mas_bottom).offset(sPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 4);
        }];
        
        [self.morningCallSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.morningCallMinuteTextField.mas_centerY);
            make.left.equalTo(self.morningCallMinuteTextField.mas_right).offset(mPadding);
        }];
        
        [self.morningCallImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.morningCallHourTextField.mas_centerY);
            make.centerX.equalTo(self.morningCallSwitch.mas_centerX);
        }];
        
        self.morningCallImgView.image = [UIImage imageNamed:@"bulb_F"];
        [self.morningCallSwitch setOn:NO];
        
        
        [self.siestaCallLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.morningCallMinuteTextField.mas_bottom).offset(lPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 4);
        }];
        
        
        [self.siestaHourTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.siestaCallLabel.mas_bottom).offset(sPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 4);
        }];
        
        
        [self.siestaMinuteTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.siestaHourTextField.mas_bottom).offset(sPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 4);
        }];
        
        [self.siestaSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.siestaMinuteTextField.mas_centerY);
            make.left.equalTo(self.siestaMinuteTextField.mas_right).offset(mPadding);
        }];
        
        [self.siestaCallImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.siestaHourTextField.mas_centerY);
            make.centerX.equalTo(self.siestaSwitch.mas_centerX);
        }];
        
        self.siestaCallImgView.image = [UIImage imageNamed:@"bulb_F"];
        [self.siestaSwitch setOn:NO];
        
    } while (NO);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
