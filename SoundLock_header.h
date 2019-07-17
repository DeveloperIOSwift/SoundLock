//headers we need! 
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVAudioSession.h>


//see if tweak is enabled!
BOOL kEnabled;


//default sound switches 
BOOL kUseDefaultLock;
BOOL kUseDefaultLSCode;

//SoundLock Strings (for audio)
NSString *kUnlock;
NSString *kLock;
NSString *kLSCode;




HBPreferences *preferences;

//Sound identifiers
SystemSoundID unlockSound;


//delete key file :P
NSString *deleteKeyFile = [[NSBundle bundleWithPath:@"/System/Library/Audio/UISounds/"] pathForResource:@"key_press_delete" ofType:@"caf"];

//volume control string :P
#define volString [NSString stringWithFormat:@"/Library/Application Support/SoundLock/VolumeSounds/%@", kVolumeSounds]

AVAudioSession *session = [AVAudioSession sharedInstance];

//interfaces 

@interface CUCaptureController : NSObject
+(id)sharedInstance;
-(BOOL)isCapturingVideo;
-(BOOL)isCapturingBurst;
@end

@interface CAMViewfinderViewController : UIViewController
-(BOOL)isCapturingPhoto;
@end

@interface SBHUDView : UIView
@end


@interface SBMediaController : NSObject
+(id)sharedInstance;
-(BOOL)isPlaying;
@end

@interface SBFolderController : NSObject 
-(BOOL)isOpen;
@end

@interface SBLockScreenViewControllerBase : UIViewController
-(BOOL)isAuthenticated;
@end
 
@interface SBLockScreenManager : NSObject
+(SBLockScreenManager *)sharedInstance;
-(SBLockScreenViewControllerBase *)lockScreenViewController;
-(BOOL)isUILocked;
@end

@interface SBCoverSheetSlidingViewController : UIViewController
-(void)_handleDismissGesture:(id)arg1 ;
-(void)setPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(/*^block*/id)arg3 ;
@end

@interface UIKBTree : NSObject
@property (nonatomic, strong, readwrite) NSString * name;
+(id)sharedInstance;
+(id)key;
@end

@interface UIKeyboardLayoutStar : UIView
@property (nonatomic, copy) NSString * localizedInputKey;
-(void)setPlayKeyClickSoundOn:(int)arg1;
@end
