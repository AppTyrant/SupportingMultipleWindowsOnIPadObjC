//
//  Models.m
//  SupportingMultipleWindowsOnIPadObjC
//
//  Created by ANTHONY CRUZ on 10/30/19.
//  Copyright © 2019 Writes for All. All rights reserved.
//

#import "Models.h"

@implementation Photo

NSString *const GalleryOpenDetailActivityType = @"com.apple.gallery.openDetail";
NSString *const GalleryOpenDetailPath = @"openDetail";
NSString *const GalleryOpenDetailPhotoIdKey = @"photoId";

+(Photo*)photWithName:(NSString*)name
{
    return [[self alloc]initWithName:name userActivity:nil];
}

+(Photo*)photWithName:(NSString*)name userActivity:(NSUserActivity*)userActivity
{
    return [[self alloc]initWithName:name userActivity:userActivity];
}

-(instancetype)initWithName:(NSString*)name userActivity:(NSUserActivity*)userActivity
{
    self = [super init];
    if (self)
    {
        _name = name;
        if (userActivity == nil)
        {
            userActivity = [[NSUserActivity alloc]initWithActivityType:GalleryOpenDetailActivityType];
            userActivity.title = GalleryOpenDetailPath;
            userActivity.userInfo = @{GalleryOpenDetailPhotoIdKey:name};
        }
        _openDetailUserActivity = userActivity;
    }
    return self;
}

-(instancetype)initWithName:(NSString*)name
{
    return [self initWithName:name userActivity:nil];
}

@end

@implementation PhotoSection

+(PhotoSection*)sectionWithName:(NSString*)name photos:(NSArray<Photo*>*)photos
{
    return [[self alloc]initWithName:name photos:photos];
}

-(instancetype)initWithName:(NSString*)name photos:(NSArray<Photo*>*)photos
{
    self = [super init];
    if (self)
    {
        _name = name;
        _photos = photos;
    }
    return self;
}

@end

@implementation PhotoManager : NSObject

+(nonnull PhotoManager*)sharedManager
{
    static PhotoManager *manager = nil;
    
    static dispatch_once_t token;
    dispatch_once(&token,^{
        manager = [[self alloc]init];
    });
    return manager;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _sections = @[[PhotoSection sectionWithName:@"Section 1"
                                             photos:@[[Photo photWithName:@"1.jpg"],
                                                      [Photo photWithName:@"2.jpg"]]],
                      [PhotoSection sectionWithName:@"Section 2"
                                             photos:@[[Photo photWithName:@"3.jpg"],
                                                      [Photo photWithName:@"4.jpg"],
                                                      [Photo photWithName:@"5.jpg"]]],
                      [PhotoSection sectionWithName:@"Section 3"
                                             photos:@[[Photo photWithName:@"6.jpg"],
                                                      [Photo photWithName:@"7.jpg"]]]];
         
    }
    return self;
}

@end
