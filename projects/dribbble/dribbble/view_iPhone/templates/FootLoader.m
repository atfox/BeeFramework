//
//	 ______    ______    ______
//	/\  __ \  /\  ___\  /\  ___\
//	\ \  __<  \ \  __\_ \ \  __\_
//	 \ \_____\ \ \_____\ \ \_____\
//	  \/_____/  \/_____/  \/_____/
//
//
//	Copyright (c) 2014-2015, Geek Zoo Studio
//	http://www.bee-framework.com
//
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//

#import "FootLoader.h"

#pragma mark -

@implementation FootLoader

+ (void)load
{
	[FootLoader setDefaultSize:CGSizeMake( [UIScreen mainScreen].bounds.size.width, 50 )];
	[FootLoader setDefaultClass:[FootLoader class]];
}

- (void)load
{
	self.FROM_RESOURCE( @"FootLoader.xml" );
	
	$(@"#ind").HIDE();
	$(@"#state").DATA( __TEXT(@"tips_more") );
}

- (void)unload
{
}

#pragma mark -

ON_SIGNAL3( BeeUIFootLoader, STATE_CHANGED, signal )
{
	BeeUIActivityIndicatorView * indicator = (BeeUIActivityIndicatorView *)$(@"#ind").view;

	if ( self.loading )
	{
		[indicator startAnimating];
		
		$(@"#state").DATA( @"Loading..." );
	}
	else
	{
		[indicator stopAnimating];

		if ( self.more )
		{
			$(@"#state").DATA( @"Click to load more" );
		}
		else
		{
			$(@"#state").DATA( @"No more" );
		}
	}
}

@end
