#import "SoundLockUnlock.h"

@implementation SoundLockUnlockListController


+ (NSString *)hb_specifierPlist {

    return @"SoundLockUnlock";
    
}

-(void)listThatDir {
   directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Application Support/SoundLock/LockSounds/Unlock" error:NULL];
}

-(void)loadView {
    [super loadView];

    [self listThatDir];

}

- (void)setAndPreview:(id)value forSpecifier:(id)specifier {
// Sample sound and set
    AudioServicesDisposeSystemSoundID(soundSelected);
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/SoundLock/LockSounds/Unlock/%@",value]],&soundSelected);
    AudioServicesPlaySystemSound(soundSelected);
    
    [super setPreferenceValue:value specifier:specifier];
}

- (NSArray *)getData:(id)target {
NSMutableArray *listing = [NSMutableArray arrayWithObjects:@"None",nil];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pathExtension != ''"];
    for (NSURL *fileURL in [directoryContent filteredArrayUsingPredicate:predicate]) {
	[listing addObject:fileURL];
    }
    return listing;
}

- (void)previewAndSet:(id)value forSpecifier:(id)specifier{
    // Sample sound and set
    AudioServicesDisposeSystemSoundID(selectedSound);
    AudioServicesPlaySystemSound(selectedSound);
    
    [super setPreferenceValue:value specifier:specifier];
}

// List our directory content
- (NSArray *)getValues:(id)target{
	NSMutableArray *listing = [NSMutableArray arrayWithObjects:@"None",nil];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pathExtension != ''"];
  
    return listing;
}
@end

// vim:ft=objc
