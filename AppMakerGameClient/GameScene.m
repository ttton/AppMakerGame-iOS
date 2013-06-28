//
//  GameScene.m
//  project-x-clientTest2
//
//  Created by Jia Xun Li on 28/08/12.
//
//

#import "GameScene.h"

NSString *result;
@implementation GameScene
+(id) scene
{
    CCScene *scene = [CCScene node];
    
    GameScene *layer = [GameScene node];
    
    [scene addChild: layer];
    
    return scene;
}

-(void)buttonTapped:(id)sender
{
	NSLog(@"buttonTapped");
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    //Terminate editing
    [textField resignFirstResponder];
    return 1;
}


- (void)textFieldDidEndEditing:(UITextField*)textField {
    NSString *response;
    if (textField==loginField) {
        [loginField endEditing:YES];
        [loginField removeFromSuperview];
        // here is where you should do something with the data they entered
        result = loginField.text;
        NSURL *url=[NSURL URLWithString:[@"http://ec2-23-20-131-92.compute-1.amazonaws.com/project_x_deploy/AccountService.svc/UserLogin/name=" stringByAppendingFormat:result]];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
        [request setRequestMethod:@"GET"];
        [request startSynchronous];
        NSError *error=[request error];
        if (!error) {
            response=[request responseString];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"login" message:response delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

-(void)buttonMethod{
    [wrapper setVisible:true];
    wrapper.contentSize=CGSizeMake(200, 260);
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"textfield" message:loginField.text delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [alert show];

}

-(void)addUIViewItem{
    // create item programatically
    CGRect bound=CGRectMake(0, 0, 640, 960);
    view=[[UIView alloc]initWithFrame:bound];
    [view setBackgroundColor:[UIColor yellowColor]];
    
    testButton=[[UIButton alloc]initWithFrame:CGRectMake(300, 100, 25, 25)];
    [testButton setTitle:@"test" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(buttonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:testButton];
    
    loginField=[[UITextField alloc]initWithFrame:CGRectMake(400, 200, 150, 30)];
    [loginField setBorderStyle:UITextBorderStyleRoundedRect];
    loginField.keyboardType=UIKeyboardTypeDefault;
    
    loginField.font = [UIFont systemFontOfSize:14.0f];
    loginField.placeholder=@"<Login with valid username";
    loginField.autocorrectionType=UITextAutocorrectionTypeNo;
    [loginField setDelegate:self];
    [view addSubview:loginField];
    
    wrapper=[CCUIViewWrapper wrapperForUIView:view];
    wrapper.contentSize=CGSizeMake(bound.size.width, bound.size.height);
    wrapper.position=ccp(0, 0);
    [self addChild:wrapper];
}

-(id) init
{
    
    if( (self=[super init] )) {
        [wrapper setParent:self];
        [self addUIViewItem];
        }
    return self;
}

- (void) dealloc
{
    [self removeChild:wrapper cleanup:true];
	[loginField release];
	[super dealloc];
}
@end
