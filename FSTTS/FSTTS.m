//
//  FSTTS.m
//  FSAccount
//
//  Created by FudonFuchina on 2019/5/19.
//

#import "FSTTS.h"
#import  <AVFoundation/AVFoundation.h>

@implementation FSTTS {
    AVSpeechUtterance       *_utterance;
    AVSpeechSynthesisVoice  *_voice;
    AVSpeechSynthesizer     *_synthesizer;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
                
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory: AVAudioSessionCategoryPlayback withOptions: AVAudioSessionCategoryOptionMixWithOthers error: nil];
        [session setActive: YES withOptions: AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error: nil];
        
        _voice = [AVSpeechSynthesisVoice voiceWithLanguage: @"zh-CN"];
    }
    return self;
}

- (void)speech:(NSString *)text priority:(NSInteger)priority wait:(BOOL)wait {
    if (!text || text.length == 0) {
        return;
    }
        
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString: text];
        
    utterance.voice = _voice;
    utterance.rate = 0.5;
    utterance.volume = 1.0;
    utterance.pitchMultiplier = 1.0;
    utterance.preUtteranceDelay = 0.1;
        
    [_synthesizer speakUtterance: utterance];
}
    
@end
