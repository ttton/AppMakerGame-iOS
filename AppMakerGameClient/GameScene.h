//
//  GameScene.h
//  project-x-clientTest2
//
//  Created by Jia Xun Li on 28/08/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import <UIKit/UIKit.h>
#import "CCUIViewWrapper.h"
#import "ASIHTTPRequest.h"
@interface GameScene : CCLayer{
    UITextField *loginField;
    UIButton *testButton;
    UIView* view;
    CCUIViewWrapper *wrapper;
    CCUIViewWrapper *buttonWrapper;
}
+(id) scene;
@end
