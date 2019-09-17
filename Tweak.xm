#import "SoundLock_header.h"

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application {
if (kEnabled && ![[%c(SBRespringController) sharedInstance] isRespring] && ! kUseDefaultRespring) {

%orig;

// Put custom sound code here like every other thing :P

respringSound = 0;

AudioServicesDisposeSystemSoundID(respringSound);

AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/SoundLock/LockSounds/BootSounds/%@",kRespring]],& respringSound);
AudioServicesPlaySystemSound(respringSound);

}
}
%end
//grouping this so we don’t have it be called on iOS 10!
%group 1112
%hook SBCoverSheetPrimarySlidingViewController
 //fixes issues with duplicate unlock sound -__- 
-(void)_handleDismissGesture:(id)arg1 {
    if (kEnabled && [[[%c(SBLockScreenManager) sharedInstance] lockScreenViewController] isAuthenticated]) {
              %orig;
        AudioServicesDisposeSystemSoundID(unlockSound);
    }
 
     else {

     %orig;

    }
}
%end
%end
 
%hook SBDashBoardViewController
-(void)prepareForUIUnlock {

	if (kEnabled) {
         	%orig;

                           unlockSound = 0;

			     AudioServicesDisposeSystemSoundID(unlockSound);
				AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/SoundLock/LockSounds/Unlock/%@", kUnlock]],& unlockSound);
				AudioServicesPlaySystemSound(unlockSound);


      }
	
	else {
		%orig;
	}
	
}
%end

%hook SBUIPasscodeLockViewBase 

-(void)_sendDelegateKeypadKeyDown {

if (kEnabled && !kUseDefaultLSCode) {
        %orig;


            SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/SoundLock/LockSounds/LSPasscode/%@",kLSCode]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);


}

	
	else {
		%orig;
	}
}
-(void)setPlaysKeypadSounds:(BOOL)arg1 {
     if (kEnabled && !kUseDefaultLSCode) {
        
} 

      else {
		%orig;
	}
}
%end
	
%group iOS12
%hook SBSleepWakeHardwareButtonInteraction
-(void)_playLockSound {
	if (kEnabled && ![[%c(SBLockScreenManager) sharedInstance] isUILocked] && ! kUseDefaultLock) {



            SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/SoundLock/LockSounds/Lock/%@",kLock]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);


		
}
	
	else {
		%orig;
	}
}
%end
%end

%group iOS11	
%hook SBLockHardwareButtonActions
-(void)_playLockSound {
	if (kEnabled && ![[%c(SBLockScreenManager) sharedInstance] isUILocked] && ! kUseDefaultLock)  {



            SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/SoundLock/LockSounds/Lock/%@",kLock]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);


}
	
	else {
		%orig;
	}
}
%end	
%end	



extern NSString *const HBPreferencesDidChangeNotification;

%ctor {

if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) {
       %init(1112);
}
	
if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.0)
{
	%init(iOS12);
}
else
{
  	%init(iOS11);
}
 
%init(_ungrouped);
 
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.yakir.soundlock"];

	[preferences registerBool:&kEnabled default:NO forKey:@"kEnabled"];

	[preferences registerObject:&kUnlock default:nil forKey:@"kUnlock"];

[preferences registerObject:&kRespring default:nil forKey:@"kRespring"];

[preferences registerBool:&kUseDefaultRespring default:NO forKey:@"kUseDefaultRespring"];

	[preferences registerObject:&kLSCode default:nil forKey:@"kLSCode"];
	[preferences registerBool:&kUseDefaultLSCode default:NO forKey:@"kUseDefaultLSCode"];

	[preferences registerObject:&kLock default:nil forKey:@"kLock"];
	[preferences registerBool:&kUseDefaultLock default:NO forKey:@"kUseDefaultLock"];

}
