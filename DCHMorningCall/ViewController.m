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
#import <libextobjc/EXTScope.h>
#import "DCHFloatLabeledTextField.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *morningCallLabel;
@property (nonatomic, strong) DCHFloatLabeledTextField *morningCallHourTextField;
@property (nonatomic, strong) DCHFloatLabeledTextField *morningCallMinuteTextField;
@property (nonatomic, strong) UIImageView *morningCallImgView;
@property (nonatomic, strong) UISwitch *morningCallSwitch;
@property (nonatomic, strong) DCHTrigger *morningCallTrgger;

@property (nonatomic, strong) UILabel *siestaCallLabel;
@property (nonatomic, strong) DCHFloatLabeledTextField *siestaHourTextField;
@property (nonatomic, strong) DCHFloatLabeledTextField *siestaMinuteTextField;
@property (nonatomic, strong) UIImageView *siestaCallImgView;
@property (nonatomic, strong) UISwitch *siestaSwitch;
@property (nonatomic, strong) DCHTrigger *siestaTrgger;

@end

@implementation ViewController

- (void)dealloc {
    [self.morningCallTrgger unobserveAll];
    [self.siestaTrgger unobserveAll];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (DCH_IsEmpty(self.morningCallLabel)) {
        self.morningCallLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.morningCallLabel.textColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallLabel.font = [UIFont boldSystemFontOfSize:titleFontSize];
        self.morningCallLabel.text = DCHMorningCallLocalizedString(@"str_MorningCall");
        [self.view addSubview:self.morningCallLabel];
    }
    if (DCH_IsEmpty(self.morningCallHourTextField)) {
        self.morningCallHourTextField = [[DCHFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        self.morningCallHourTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.morningCallHourTextField.floatingLabelTextColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallHourTextField.floatingLabelActiveTextColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallHourTextField.font = [UIFont systemFontOfSize:textFieldFontSize];
        [self.morningCallHourTextField setPlaceholder:DCHMorningCallLocalizedString(@"str_MorningCallHour") floatingTitle:DCHMorningCallLocalizedString(@"str_MorningCallHour")];
        [self.view addSubview:self.morningCallHourTextField];
    }
    if (DCH_IsEmpty(self.morningCallMinuteTextField)) {
        self.morningCallMinuteTextField = [[DCHFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        self.morningCallMinuteTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.morningCallMinuteTextField.floatingLabelTextColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallMinuteTextField.floatingLabelActiveTextColor = clr_DCHMorningCall_MainThemeColor;
        self.morningCallMinuteTextField.font = [UIFont systemFontOfSize:textFieldFontSize];
        [self.morningCallMinuteTextField setPlaceholder:DCHMorningCallLocalizedString(@"str_MorningCallMinute") floatingTitle:DCHMorningCallLocalizedString(@"str_MorningCallMinute")];
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
        self.morningCallSwitch.enabled = NO;
        [self.view addSubview:self.morningCallSwitch];
    }
    
    if (DCH_IsEmpty(self.siestaCallLabel)) {
        self.siestaCallLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.siestaCallLabel.textColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaCallLabel.font = [UIFont systemFontOfSize:titleFontSize];
        self.siestaCallLabel.text = DCHMorningCallLocalizedString(@"str_Siesta");
        [self.view addSubview:self.siestaCallLabel];
    }
    if (DCH_IsEmpty(self.siestaHourTextField)) {
        self.siestaHourTextField = [[DCHFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        self.siestaHourTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.siestaHourTextField.floatingLabelTextColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaHourTextField.floatingLabelActiveTextColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaHourTextField.font = [UIFont systemFontOfSize:textFieldFontSize];
        [self.siestaHourTextField setPlaceholder:DCHMorningCallLocalizedString(@"str_SiestaHour") floatingTitle:DCHMorningCallLocalizedString(@"str_SiestaHour")];
        [self.view addSubview:self.siestaHourTextField];
    }
    if (DCH_IsEmpty(self.siestaMinuteTextField)) {
        self.siestaMinuteTextField = [[DCHFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        self.siestaMinuteTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.siestaMinuteTextField.floatingLabelTextColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaMinuteTextField.floatingLabelActiveTextColor = clr_DCHMorningCall_MainThemeColor;
        self.siestaMinuteTextField.font = [UIFont systemFontOfSize:textFieldFontSize];
        [self.siestaMinuteTextField setPlaceholder:DCHMorningCallLocalizedString(@"str_SiestaMinute") floatingTitle:DCHMorningCallLocalizedString(@"str_SiestaMinute")];
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
        self.siestaSwitch.enabled = NO;
        [self.view addSubview:self.siestaSwitch];
    }
    
    if (DCH_IsEmpty(self.morningCallTrgger)) {
        self.morningCallTrgger = [[DCHTrigger alloc] init];
        @weakify(self)
        [self.morningCallTrgger addAction:^(DCHTrigger *trigger, NSDictionary *exInfo) {
            @strongify(self)
            do {
                if (self.morningCallHourTextField.vaild && self.morningCallMinuteTextField.vaild) {
                    self.morningCallSwitch.enabled = YES;
                } else {
                    self.morningCallSwitch.enabled = NO;
                }
            } while (NO);
        } onCondition:^BOOL(DCHTrigger *trigger, NSDictionary *exInfo) {
            return YES;
        }];
        
        [self.morningCallTrgger observe:self.morningCallHourTextField keyPath:@"vaild"];
        [self.morningCallTrgger observe:self.morningCallMinuteTextField keyPath:@"vaild"];
    }
    
    if (DCH_IsEmpty(self.siestaTrgger)) {
        self.siestaTrgger = [[DCHTrigger alloc] init];
        @weakify(self)
        [self.siestaTrgger addAction:^(DCHTrigger *trigger, NSDictionary *exInfo) {
            @strongify(self)
            do {
                if (self.siestaHourTextField.vaild && self.siestaMinuteTextField.vaild) {
                    self.siestaSwitch.enabled = YES;
                } else {
                    self.siestaSwitch.enabled = NO;
                }
            } while (NO);
        } onCondition:^BOOL(DCHTrigger *trigger, NSDictionary *exInfo) {
            return YES;
        }];
        
        [self.siestaTrgger observe:self.siestaHourTextField keyPath:@"vaild"];
        [self.siestaTrgger observe:self.siestaMinuteTextField keyPath:@"vaild"];
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
            make.right.equalTo(superview.mas_right).offset(-lPadding * 3);
        }];
        
        
        [self.morningCallHourTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.morningCallLabel.mas_bottom).offset(sPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 3);
        }];
        
        
        [self.morningCallMinuteTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.morningCallHourTextField.mas_bottom).offset(sPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 3);
        }];
        
        [self.morningCallSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.morningCallMinuteTextField.mas_centerY);
            make.right.equalTo(superview.mas_right).offset(-lPadding);
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
            make.right.equalTo(superview.mas_right).offset(-lPadding * 3);
        }];
        
        
        [self.siestaHourTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.siestaCallLabel.mas_bottom).offset(sPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 3);
        }];
        
        
        [self.siestaMinuteTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.siestaHourTextField.mas_bottom).offset(sPadding);
            make.left.equalTo(superview.mas_left).offset(lPadding);
            make.height.equalTo(@48);
            make.right.equalTo(superview.mas_right).offset(-lPadding * 3);
        }];
        
        [self.siestaSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.siestaMinuteTextField.mas_centerY);
            make.right.equalTo(superview.mas_right).offset(-lPadding);
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
