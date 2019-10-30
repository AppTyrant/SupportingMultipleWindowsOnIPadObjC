//
//  PhotoDetailViewController.h
//  SupportingMultipleWindowsOnIPadObjC
//
//  Created by ANTHONY CRUZ on 10/30/19.
//  Copyright © 2019 Writes for All. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;

@interface PhotoDetailViewController : UIViewController

+(PhotoDetailViewController*)newPhotoDetailViewController;

@property (nonatomic,strong) Photo *photo;

@end
