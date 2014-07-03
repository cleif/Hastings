//
//  SodexoTableViewCell.m
//  Hastings
//
//  Created by Creighton Leif on 7/3/14.
//
//

#import "SodexoTableViewCell.h"

@implementation SodexoTableViewCell

@synthesize menuItem = _menuItem;
@synthesize menuDescription = _menuDescription;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) bindCellDetails:(SodexoModel *) menuDetails{
    
    self.menuItem.text = menuDetails.itemName;
    self.menuDescription.text = menuDetails.itemDescription;
    
}

@end
