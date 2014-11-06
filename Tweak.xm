//////////////////////////
// WHAT WE NEED TO KNOW //
//////////////////////////

#import <UIKit/UIKit.h>

@interface WASettingsViewController : UIViewController

@end

///////////
// HOOKS //
///////////

%hook WASettingsViewController
		
-(void)viewDidLoad 
{
	%orig;
	
	UIBarButtonItem *debugButton = [[UIBarButtonItem alloc] initWithTitle:@"Debug" style:UIBarButtonItemStylePlain target:self action:@selector(debugPressed)];
	
	[self.navigationItem setRightBarButtonItem:debugButton animated:NO];
	
}

%new(v@:)
-(void)debugPressed 
{
	id debugVC = [[%c(DebugViewController) alloc] init];
	[self.navigationController pushViewController:debugVC animated:YES];
}

%end
    