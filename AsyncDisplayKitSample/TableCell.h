//
//  TableCell.h
//  AsyncDisplayKitSample
//
//  Created by S@nchit on 1/18/17.
//  Copyright © 2017 S@nchit. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface TableCell : ASCellNode

-(instancetype)init : (NSString *)buttonText withDescription:(NSString *)text andImage:(UIImage *)image;

@end
