//
//  DCHFloatLabeledTextField.m
//  DCHMorningCall
//
//  Created by Derek Chen on 9/8/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHFloatLabeledTextField.h"
#import <Tourbillon/DCHTourbillon.h>
#import <libextobjc/EXTScope.h>

@interface DCHFloatLabeledTextField ()

@property (nonatomic, assign) BOOL vaild;
@property (nonatomic, strong) DCHTrigger *trigger;

@end

@implementation DCHFloatLabeledTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.trigger = [[DCHTrigger alloc] init];
        self.vaild = NO;
        
        @weakify(self)
        [self.trigger addAction:^(DCHTrigger *trigger, NSDictionary *exInfo) {
            @strongify(self)
            if (self.text.length == 0) {
                self.vaild = NO;
            } else if (self.text.length > 0) {
                self.vaild = YES;
            }
        } onCondition:^BOOL(DCHTrigger *trigger, NSDictionary *exInfo) {
            @strongify(self)
            if (self.text.length == 1 || self.text.length == 0) {
                return YES;
            } else {
                return NO;
            }
        }];
        
        [self.trigger observe:self notification:UITextFieldTextDidChangeNotification];
    }
    return self;
}

- (void)dealloc {
    [self.trigger unobserveAll];
}

@end
