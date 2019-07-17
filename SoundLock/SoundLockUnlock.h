//libcephei prefs headers we need 
#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBTintedTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <CepheiPrefs/HBImageTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>
//regular ones we need 
#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVAudioSession.h>
#import <AudioToolbox/AudioServices.h>

//preferences interface 


@interface SoundLockUnlockListController: HBListController {
	SystemSoundID selectedSound;
       SystemSoundID soundSelected;
}
- (NSArray *)getValues:(id)target;
- (void)previewAndSet:(id)value forSpecifier:(id)specifier;
- (NSArray *)getData:(id)target;
- (void)setAndPreview:(id)value forSpecifier:(id)specifier;
- (void)listThatDir;
@end
  
  NSArray *directoryContent;
