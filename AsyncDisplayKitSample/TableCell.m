//
//  TableCell.m
//  AsyncDisplayKitSample
//
//  Created by S@nchit on 1/18/17.
//  Copyright © 2017 S@nchit. All rights reserved.
//

#import "TableCell.h"

@interface TableCell()

@property (strong,nonatomic) ASImageNode *imageNode;
@property (strong,nonatomic) ASTextNode *label;
@property (strong,nonatomic) ASButtonNode *dedicateButton;

@property (strong,nonatomic) NSString *buttonText;
@property (strong,nonatomic) NSString *labelText;
@property (strong,nonatomic) UIImage *image;

@end

@implementation TableCell

-(instancetype)init : (NSString *)buttonText withDescription:(NSString *)text andImage:(UIImage *)image{
    if (!(self = [super init])) { return nil; }
    self.buttonText = buttonText;
    self.labelText = text;
    self.image = image;
    [self setupViews];
    return self;
}

-(void)setupViews{
    self.imageNode = [[ASImageNode alloc]init];
    self.imageNode.image = self.image;
    self.label = [[ASTextNode alloc]init];
    NSAttributedString *btnAtrText = [[NSAttributedString alloc]initWithString:self.buttonText attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16.0f]}];
    NSAttributedString *labelAttrText = [[NSAttributedString alloc]initWithString:self.labelText attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16.0f]}];
    self.label.attributedText = labelAttrText;
    self.dedicateButton = [[ASButtonNode alloc]init];
    self.dedicateButton.titleNode.attributedText = btnAtrText;
//    self.dedicateButton.titleNode.backgroundColor = [UIColor greenColor];
    self.dedicateButton.backgroundColor = [UIColor greenColor];
    [self addSubnode:self.imageNode];
    [self addSubnode:self.label];
    [self addSubnode:self.dedicateButton];
}

-(ASLayoutSpec *) layoutSpecThatFits:(ASSizeRange)constrainedSize{
    //vertical stack
    ASStackLayoutSpec *textAndButtonStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    textAndButtonStack.style.flexShrink = 1.0;
    textAndButtonStack.style.flexGrow = 1.0;
    self.dedicateButton.style.preferredSize = CGSizeMake(90, 25);
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.dedicateButton.layer.cornerRadius = 10.0;
//    });
    
    
    textAndButtonStack.spacing = 10.0f;
    textAndButtonStack.children = @[self.label,self.dedicateButton];
    
    //horizontal stack
    ASStackLayoutSpec *imageAndVerticalStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    imageAndVerticalStack.spacing = 10.0f;
    imageAndVerticalStack.alignItems = ASStackLayoutAlignSelfAuto;
    self.imageNode.style.preferredSize = CGSizeMake(50, 50);
    [self.imageNode setBackgroundColor:[UIColor greenColor]];
    imageAndVerticalStack.children = @[self.imageNode,textAndButtonStack];
    
    int64_t delayInSeconds = 0.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.dedicateButton.layer.cornerRadius = 12.5;
                    //[self.dedicateButton.titleNode setBackgroundColor:[UIColor colorWithRed:199/255 green:48/255 blue:44/255 alpha:1.0]];
                    
                    //self.dedicateButton.layer.cornerRadius = 10.0f;
                    self.dedicateButton.layer.borderColor = [UIColor whiteColor].CGColor;
                });
            });
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) child:imageAndVerticalStack];
}

@end
