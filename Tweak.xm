//////////////////////////
// WHAT WE NEED TO KNOW //
//////////////////////////

@interface SettingsViewController : UIViewController

-(int)numberOfSectionsInTableView:(id)tableView;

@end

///////////
// HOOKS //
///////////

%hook SettingsViewController

-(id)tableView:(id)tableView willSelectRowAtIndexPath:(id)indexPath
{
    if ([indexPath section] == ([self numberOfSectionsInTableView:tableView] - 1)) {
        
        return indexPath;
        
    } else {
        
        return %orig(tableView,indexPath);
    }
}
    
    
-(void)tableView:(id)tableView didSelectRowAtIndexPath:(id)indexPath
{        
    if ([indexPath section] == ([self numberOfSectionsInTableView:tableView] - 1)) {
        
        id debugVC = [[%c(DebugViewController) alloc] init];        
        [[self navigationController] pushViewController:debugVC animated:YES];
        
    }
          
    %orig(tableView,indexPath);
}


-(id)tableView:(id)tableView cellForRowAtIndexPath:(id)indexPath
{      
    if ([indexPath section] == ([self numberOfSectionsInTableView:tableView] - 1)) {
        
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"Debug Menu";
        
        return cell;
        
    }
          
    return %orig(tableView,indexPath);
}

-(int)numberOfSectionsInTableView:(id)tableView
{
    return %orig(tableView) + 1;
}
    
-(int)tableView:(id)tableView numberOfRowsInSection:(int)section
{                
    if (section == ([self numberOfSectionsInTableView:tableView] - 1)) {
        return 1;
    }
    
    return %orig(tableView,section);    
}

%end
    
    