//
//  LayoutHeightCell.m
//  NSLayoutConstraintDemo
//
//  Created by dome on 2017/12/12.
//  Copyright © 2017年 Tsunami. All rights reserved.
//

#import "LayoutHeightCell.h"

@interface LayoutHeightCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *user;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end

@implementation LayoutHeightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildView];
    }
    return self;
}

- (void)buildView
{
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = [UIColor brownColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.numberOfLines = 1;
    [self.contentView addSubview:titleLabel];
    
    UILabel * contentLabel = [[UILabel alloc]init];
    contentLabel.textColor = [UIColor brownColor];
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.numberOfLines = 0;
    [self.contentView addSubview:contentLabel];
    
    UILabel * user = [[UILabel alloc]init];
    user.textColor = [UIColor brownColor];
    user.font = [UIFont systemFontOfSize:15];
    user.textAlignment = NSTextAlignmentLeft;
    user.numberOfLines = 1;
    [self.contentView addSubview:user];
    
    UILabel * time = [[UILabel alloc]init];
    time.textColor = [UIColor brownColor];
    time.font = [UIFont systemFontOfSize:15];
    time.textAlignment = NSTextAlignmentLeft;
    time.numberOfLines = 1;
    [self.contentView addSubview:time];
    
    UIImageView * image = [[UIImageView alloc]init];
    image.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:image];
    
    self.title = titleLabel;
    self.content = contentLabel;
    self.image = image;
    self.user = user;
    self.time = time;
    
    self.title.translatesAutoresizingMaskIntoConstraints = NO;
    self.content.translatesAutoresizingMaskIntoConstraints = NO;
    self.image.translatesAutoresizingMaskIntoConstraints = NO;
    self.user.translatesAutoresizingMaskIntoConstraints = NO;
    self.time.translatesAutoresizingMaskIntoConstraints = NO;

    
    NSDictionary * views = NSDictionaryOfVariableBindings(titleLabel,contentLabel,image,user,time);
    
    NSString * title_Hvfl = @"H:|-10-[titleLabel]-10-|";
    NSString * title_Vvfl = @"V:|-10-[titleLabel]-5-[contentLabel]-5-[image]-5-[user]-5-|";
    NSString * time_Hvfl = @"H:[user]-(>=5)-[time(<=100)]-10-|";
    NSString * content_Hvfl = @"H:[contentLabel]-10-|";
    
    NSArray * title_Hlayout = [NSLayoutConstraint constraintsWithVisualFormat:title_Hvfl options:0 metrics:nil views:views];
    
    NSArray * title_Vlayout = [NSLayoutConstraint constraintsWithVisualFormat:title_Vvfl options:NSLayoutFormatAlignAllLeft metrics:nil views:views];
    NSArray * time_Hlayout = [NSLayoutConstraint constraintsWithVisualFormat:time_Hvfl options:NSLayoutFormatAlignAllBaseline metrics:nil views:views];
    NSArray * content_Hlayout = [NSLayoutConstraint constraintsWithVisualFormat:content_Hvfl options:0 metrics:nil views:views];
    
    [self.contentView addConstraints:title_Hlayout];
    [self.contentView addConstraints:title_Vlayout];
    [self.contentView addConstraints:time_Hlayout];
    [self.contentView addConstraints:content_Hlayout];

}

- (void)setModel:(LayoutCellModel *)model
{
    _model = model;
    _title.text = model.title;
    _content.text = model.content;
    _user.text = model.username;
    _time.text = model.time;
    _image.image = model.imageName.length > 0?[UIImage imageNamed:model.imageName]:nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
