//
//  MainMenuScene.m
//  project-x-clientTest2
//
//  Created by Jia Xun Li on 28/08/12.
//
//

#import "MainMenuScene.h"
#import "GameScene.h"

@implementation MainMenuScene

+(id)scene{
    CCScene *scene=[CCScene node];
    MainMenuScene *layer=[MainMenuScene node];
    [scene addChild:layer];
    return scene;
}

-(id)init{
    if ((self=[super init])) {
        
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"Main Menu" fontName:@"Courier" fontSize:64];
        title.position =  ccp(240, 240);
     
        CCLayer *menuLayer = [[CCLayer alloc] init];
        [self addChild:menuLayer];[self addChild: title];
        CCMenuItemImage *startButton = [CCMenuItemImage
                                        itemFromNormalImage:@"startButton.png"
                                        selectedImage:@"startButtonSelected.png"
                                        target:self
                                        selector:@selector(startGame:)];
        startButton.position=ccp(30, -80);
        CCMenu *menu=[CCMenu menuWithItems:startButton, nil];
        [menuLayer addChild:menu];
    }
    return self;
}

-(void)startGame:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[GameScene scene]];
}

-(void)dealloc{
    [super dealloc];
}
@end
