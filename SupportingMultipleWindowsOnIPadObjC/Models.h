//
//  Models.h
//  SupportingMultipleWindowsOnIPadObjC
//
//  Created by ANTHONY CRUZ on 10/30/19.
//  Copyright © 2019 Writes for All. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

extern NSString *_Nonnull const GalleryOpenDetailActivityType;
extern NSString *_Nonnull const GalleryOpenDetailPath;
extern NSString *_Nonnull const GalleryOpenDetailPhotoIdKey;

+(nonnull Photo*)photWithName:(nonnull NSString*)name;
-(nonnull instancetype)initWithName:(nonnull  NSString*)name NS_DESIGNATED_INITIALIZER;
-(nonnull instancetype)init NS_UNAVAILABLE;

@property (nonnull,nonatomic,strong,readonly) NSString *name;
@property (nonnull,nonatomic,strong,readonly) NSUserActivity *openDetailUserActivity;

@end

@interface PhotoSection : NSObject

+(nonnull PhotoSection*)sectionWithName:(nonnull NSString*)name photos:(nonnull NSArray<Photo*>*)photos;

@property (nonnull,nonatomic,strong,readonly) NSString *name;
@property (nonnull,nonatomic,strong,readonly) NSArray <Photo*>*photos;

@end

@interface PhotoManager : NSObject

+(nonnull PhotoManager*)sharedManager;

@property (nonnull,nonatomic,strong,readonly) NSArray<PhotoSection*>*sections;

@end
