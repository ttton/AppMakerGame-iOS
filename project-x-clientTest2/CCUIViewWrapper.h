//
//  CCUIViewWrapper.h
//  project-x-clientTest2
//
//  Created by Jia Xun Li on 28/08/12.
//
//

#import "CCSprite.h"
#import "cocos2d.h"

@interface CCUIViewWrapper : CCSprite
{
	UIView *uiItem;
	float rotation;
}

@property (nonatomic, retain) UIView *uiItem;

+ (id) wrapperForUIView:(UIView*)ui;
- (id) initForUIView:(UIView*)ui;

- (void) updateUIViewTransform;

@end
