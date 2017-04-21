//
//  TableViewCell.m
//  MultiLabel
//
//  Created by 赵博 on 17/4/19.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "TableViewCell.h"
#define  SCREENWIDTH [UIScreen mainScreen].bounds.size.width
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

      
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    
    
    //第一个 label的起点
    CGSize size = CGSizeMake(5, 30);
    
    
    //间距
    CGFloat padding = 5.0;
    

    for (int i = 0; i < _titleArray.count; i ++) {
        
        CGFloat keyWorldWidth = [self getSizeByString:_titleArray[i] AndFontSize:14].width;
        if (keyWorldWidth > SCREENWIDTH) {
            keyWorldWidth = SCREENWIDTH;
        }
        //屏幕- 总宽 小于当前宽
        if (SCREENWIDTH - size.width < keyWorldWidth) {
            //换行
            size.height += 30.0;
            size.width = 5.0;
        }
        //创建 label点击事件
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(size.width, size.height-30, keyWorldWidth, 20)];
        button.titleLabel.numberOfLines = 0;
        button.backgroundColor = [UIColor redColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.layer.cornerRadius = 3.0;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(tagButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        //起点 增加
        size.width += keyWorldWidth+padding;
        NSLog(@"%f----%f",size.height,size.width);
    }
}




- (void)tagButtonClick:(UIButton *)button{
    
    NSLog(@"%@",button.titleLabel.text);
}
//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 5;
    return size;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
