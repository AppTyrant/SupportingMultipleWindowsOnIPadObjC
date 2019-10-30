//
//  GalleryViewController.m
//  SupportingMultipleWindowsOnIPadObjC
//
//  Created by ANTHONY CRUZ on 10/30/19.
//  Copyright © 2019 Writes for All. All rights reserved.
//

#import "GalleryViewController.h"
#import "Models.h"
#import "PhotoDetailViewController.h"

@interface GalleryCollectionViewCell : UICollectionViewCell

@property (nonatomic,weak) IBOutlet UIImageView *imageView;

@end

@implementation GalleryCollectionViewCell

@end

@interface GalleryViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDragDelegate>

@property (nonatomic,weak) IBOutlet UICollectionView *galleryCollectionView;

@end

@implementation GalleryViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Gallery";
    self.galleryCollectionView.delegate = self;
    self.galleryCollectionView.dataSource = self;
    self.galleryCollectionView.dragDelegate = self;
    UINib *nib = [UINib nibWithNibName:@"GalleryCollectionViewCell" bundle:nil];
    [self.galleryCollectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
}

-(Photo*)photoAtIndexPath:(NSIndexPath*)indexPath
{
    PhotoSection *section = [[PhotoManager sharedManager].sections objectAtIndex:indexPath.section];
    Photo *photo = [section.photos objectAtIndex:indexPath.item];
    return photo;
}

#pragma mark - UICollectionViewDragDelegate
-(NSArray<UIDragItem*>*)collectionView:(UICollectionView*)collectionView
itemsForBeginningDragSession:(nonnull id<UIDragSession>)session
          atIndexPath:(nonnull NSIndexPath*)indexPath
{
    Photo *selectedPhoto = [self photoAtIndexPath:indexPath];
    NSUserActivity *userActivity = selectedPhoto.openDetailUserActivity;
    NSItemProvider *itemProvider = [[NSItemProvider alloc]initWithObject:[UIImage imageNamed:selectedPhoto.name]];
    [itemProvider registerObject:userActivity visibility:NSItemProviderRepresentationVisibilityAll];
    
    UIDragItem *dragItem = [[UIDragItem alloc]initWithItemProvider:itemProvider];
    dragItem.localObject = selectedPhoto;
    return @[dragItem];
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{
    Photo *selectedPhoto = [self photoAtIndexPath:indexPath];
    PhotoDetailViewController *detailViewController = [PhotoDetailViewController newPhotoDetailViewController];
    detailViewController.photo = selectedPhoto;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return [PhotoManager sharedManager].sections.count;
}

-(NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    PhotoSection *sectionObj = [[PhotoManager sharedManager].sections objectAtIndex:section];
    return sectionObj.photos.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellID = @"Cell";
    GalleryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    Photo *photo = [self photoAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:photo.name];
    return cell;
}

@end
