//
//  FSTTS.m
//  FSAccount
//
//  Created by FudonFuchina on 2019/5/19.
//

#import "FSTTS.h"
#import  <AVFoundation/AVFoundation.h>

@implementation FSTTS{
    AVSpeechUtterance       *_utterance;
    AVSpeechSynthesisVoice  *_voice;
    AVSpeechSynthesizer     *_synthesizer;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil]; // 静音模式下也可以播放
        
        _voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        _utterance.voice = _voice;
        
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    return self;
}

- (void)speech:(NSString *)text priority:(NSInteger)priority wait:(BOOL)wait{
    _utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    _utterance.pitchMultiplier = 1;
    [_synthesizer speakUtterance:_utterance];
}

@end
