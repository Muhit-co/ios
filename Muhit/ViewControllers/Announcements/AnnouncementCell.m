//
//  AnnouncementCell.m
//  Muhit
//
//  Created by Emre YANIK on 05/06/15.
//  Copyright (c) 2015 Muhit. All rights reserved.
//

#import "AnnouncementCell.h"

@interface AnnouncementCell(){
    IBOutlet UILabel *lblTitle,*lblDate,*lblDescription,*lblHeadmanName,*lblHood;
    IBOutlet UIImageView *imgIcon,*imgHeadman;
}
@end

@implementation AnnouncementCell

- (id)init{
    
    if(self = [super init]){
        self = [[[NSBundle mainBundle] loadNibNamed:@"AnnouncementCell" owner:self options:nil] lastObject];
    }
    return self;
}

- (void)setWithDictionary:(NSDictionary *)dict{
    [lblTitle setText:dict[@"title"]];
    [lblDate setText:[UF getDetailedDateString:dict[@"created_at"]]];
    [lblDescription setText:dict[@"content"]];
    [lblHeadmanName setText:dict[@"user"][@"full_name"]];
    [lblHood setText:[UF getHoodFromAddress:dict[@"user"][@"location"]]];
    NSString *imgUrl = [NSString stringWithFormat:@"%@/60x60/%@",IMAGE_PROXY,dict[@"user"][@"picture"]];
    [imgHeadman sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:PLACEHOLDER_IMAGE];
    [imgIcon setImage:[IonIcons imageWithIcon:ion_speakerphone size:23 color:CLR_LIGHT_BLUE]];
    imgHeadman.layer.cornerRadius = 15;
}

@end
