#import "SceneDelegate.h"
#import "Models.h"
#import "PhotoDetailViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


-(void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession*)session
     options:(UISceneConnectionOptions*)connectionOptions
{
    NSUserActivity *userActivity = connectionOptions.userActivities.anyObject;
    if (userActivity == nil) { userActivity = session.stateRestorationActivity; }
    if (userActivity != nil)
    {
        [self configureWindow:self.window withActivity:userActivity];
    }

    // If there were no user activities, we don't have to do anything.
    // The `window` property will automatically be loaded with the storyboard's initial view controller.
}

-(NSUserActivity*)stateRestorationActivityForScene:(UIScene*)scene
{
    return scene.userActivity;
}

#pragma mark - Utilities
-(BOOL)configureWindow:(UIWindow*)window withActivity:(NSUserActivity*)activity
{
    if ([activity.title isEqualToString:GalleryOpenDetailPath])
    {
        NSString *photoID = [activity.userInfo objectForKey:GalleryOpenDetailPhotoIdKey];
        if (photoID != nil)
        {
            PhotoDetailViewController *photoDetailVC = [PhotoDetailViewController newPhotoDetailViewController];
            photoDetailVC.photo = [Photo photWithName:photoID];
                   
            UINavigationController *navigationController = (UINavigationController*)self.window.rootViewController;
            if ([navigationController isKindOfClass:[UINavigationController class]])
            {
                [navigationController pushViewController:photoDetailVC animated:NO];
                return YES;
            }
            else
            {
                NSLog(@"unexpected rootviewcontroller class for window: %@",navigationController);
                return NO;
            }
        }
        else
        {
            NSLog(@"didn't get photoid");
            return NO;
        }
    }
    else
    {
        return NO;
    }
}
        

@end
