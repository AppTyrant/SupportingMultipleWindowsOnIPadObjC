//
//  PhotoDetailViewController.m
//  SupportingMultipleWindowsOnIPadObjC
//
//  Created by ANTHONY CRUZ on 10/30/19.
//  Copyright © 2019 Writes for All. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "Models.h"

@interface PhotoDetailViewController ()

@property (weak,nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoDetailViewController


+(PhotoDetailViewController*)newPhotoDetailViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return [storyboard instantiateViewControllerWithIdentifier:@"PhotoDetailViewController"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.photo != nil)
    {
        self.imageView.image = [UIImage imageNamed:self.photo.name];
    }
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.view.window.windowScene.userActivity = self.photo.openDetailUserActivity;
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     self.view.window.windowScene.userActivity = nil;
}

@end
