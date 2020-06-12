/*
 Copyright (c) 2014 Noor. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 If you happen to meet one of the copyright holders in a bar you are obligated
 to buy them one pint of beer.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import "NoorCustomRaisedTabBar.h"
#import "HomeViewController.h"
#import "RightViewController.h"
#import "CenterViewController.h"
#import "LeftViewController.h"
#import "UIViewController+JASidePanel.h"

@interface NoorCustomRaisedTabBar ()

@end

@implementation NoorCustomRaisedTabBar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{
	[super viewDidLoad];
    HomeViewController *homeVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    _naviController = [[UINavigationController alloc] init];
    _naviController.delegate  = self;
    _viewControllers = @[homeVC];
    if (_viewControllers && [_viewControllers count] > 0)
    {
        [self.naviController setViewControllers:_viewControllers];
    }
    [self.contentContainerView addSubview:_naviController.view];
    self.naviController.navigationBarHidden = YES;
}
-(void) viewDidAppear:(BOOL)animated
{
    
}

#pragma mark UINavigation Controller delegates implementation

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    
    NSString *className = NSStringFromClass([[self.naviController topViewController] class]);
    NSLog(@"%@", className);
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// Only rotate if all child view controllers agree on the new orientation.
	for (UIViewController *viewController in self.viewControllers)
	{
		if (![viewController shouldAutorotateToInterfaceOrientation:interfaceOrientation])
			return NO;
	}
	return YES;
}


- (void)setViewControllers:(NSArray *)newViewControllers
{
	[self.naviController setViewControllers:newViewControllers];
}
- (UIViewController *)selectedViewController
{
    return [self.naviController topViewController];
}

- (void)setSelectedViewController:(UIViewController *)newSelectedViewController
{
	[self setSelectedViewController:newSelectedViewController animated:NO];
}

- (void)setSelectedViewController:(UIViewController *)newSelectedViewController animated:(BOOL)animated
{
	[self.naviController setViewControllers:[NSArray arrayWithObject:newSelectedViewController]];
}


- (IBAction)btnRight:(id)sender
{
    RightViewController *rVC = [[RightViewController alloc] initWithNibName:@"RightViewController" bundle:nil];
    [self.naviController  setViewControllers:[NSArray arrayWithObject:rVC]];
}

- (IBAction)btnCenter:(id)sender
{
    CenterViewController *centerVC = [[CenterViewController alloc] initWithNibName:@"CenterViewController" bundle:nil];
    [self.naviController  setViewControllers:[NSArray arrayWithObject:centerVC]];
    NSLog(@"center Pressed");
}

- (IBAction)btnLeft:(id)sender
{
    [self.sidePanelController showLeftPanelAnimated:YES];
    
}
@end
