//
//  AnimalTableViewCell.m
//  XXXXX
//
//  Created by Вова on 19.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "AnimalTableViewCell.h"
#import "ViewController.h"

@interface AnimalTableViewCell ()

@end

@implementation AnimalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _coverImageView = [UIImageView new];
        _coverImageView.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview: _coverImageView];
        
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_titleLabel];
        
        _subtitleLabel = [UILabel new];
        _subtitleLabel.backgroundColor = [UIColor brownColor];
        [self.contentView addSubview:_subtitleLabel];
        
    }
    
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
//    self.coverImageView.frame = CGRectMake(16.f, 16.f, 40, 40);
//    NSLog(@"GetMaxX = %f", CGRectGetMaxX(self.coverImageView.frame));
//    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + 16.f, 16.f, CGRectGetMaxX(self.frame) - 88.f, 16.f);
    
//    self.subtitleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + CGRectGetMaxY(self.titleLabel.frame) + 16.f, 16.f, CGRectGetMaxX(self.frame) - 88.f, 16.f);
    if (CGRectGetHeight(self.bounds) == 80) {
        self.coverImageView.frame = CGRectMake(0.f, 0.f, CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds));
    
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame), 0.f, CGRectGetMaxX(self.frame) - CGRectGetHeight(self.bounds), CGRectGetMaxX(self.coverImageView.frame) / 2);
    
        self.subtitleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame), CGRectGetMaxY(self.titleLabel.frame), CGRectGetMaxX(self.frame) - CGRectGetHeight(self.bounds), CGRectGetMaxX(self.coverImageView.frame) / 2);
    } else if (CGRectGetHeight(self.bounds) == 40) {
        self.coverImageView.frame = CGRectMake(CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds), 0.f, CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds));
        
        self.titleLabel.frame = CGRectMake(0.f, 0.f,CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds) / 2);
        
        self.subtitleLabel.frame = CGRectMake(0.f, CGRectGetMaxY(self.titleLabel.frame),CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds) / 2);
    }
               
}

@end
