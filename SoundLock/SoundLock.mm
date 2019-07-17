#import "SoundLock_prefsheader.h"

@implementation SoundLockListController

+ (NSString *)hb_specifierPlist {
    return @"SoundLock";
    
}


//share button
-(void)loadView {
    [super loadView];

self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
	
	/* Uncomment this if you want large titles for iOS 11 and higher!
self.navigationController.navigationBar.prefersLargeTitles = YES;
self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic; */
	
}

//tint color to use for toggles and buttons 
+ (UIColor *)hb_tintColor {
    return [UIColor colorWithRed:39.0/255.0 green: 39.0/255.0 blue: 43.0/255.0 alpha:1.0];
}

//share button action 
- (void)shareTapped {
   
	 NSString *shareText = @"Check out #SoundLock by @DevelopApple Download on the BigBoss Repo";
	 NSArray * itemsToShare = @[shareText];
	 
    	UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:itemsToShare applicationActivities:nil];
    
    // and present it
    [self presentActivityController:controller];
}

- (void)presentActivityController:(UIActivityViewController *)controller {
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.rightBarButtonItem;
 
}
-(void)respring {
  //thanks to @skittyblock no more system deprecation errors :P
  NSTask *task = [[[NSTask alloc] init] autorelease];
  [task setLaunchPath:@"/usr/bin/killall"];
  [task setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
  [task launch];
}

@end

// vim:ft=objc
