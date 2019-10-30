//
//  Models.h
//  SupportingMultipleWindowsOnIPadObjC
//
//  Created by ANTHONY CRUZ on 10/30/19.
//  Copyright © 2019 Writes for All. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

extern NSString *const GalleryOpenDetailActivityType;
extern NSString *const GalleryOpenDetailPath;
extern NSString *const GalleryOpenDetailPhotoIdKey;

+(Photo*)photWithName:(NSString*)name userActivity:(NSUserActivity*)userActivity;
+(Photo*)photWithName:(NSString*)name;

@property (nonatomic,strong,readonly) NSString *name;
@property (nonatomic,strong,readonly) NSUserActivity *openDetailUserActivity;

@end

@interface PhotoSection : NSObject

+(PhotoSection*)sectionWithName:(NSString*)name photos:(NSArray<Photo*>*)photos;

@property (nonatomic,strong,readonly) NSString *name;
@property (nonatomic,strong,readonly) NSArray <Photo*>*photos;

@end

@interface PhotoManager : NSObject

+(PhotoManager*)sharedManager;

@property (nonatomic,strong,readonly) NSArray<PhotoSection*>*sections;

@end
