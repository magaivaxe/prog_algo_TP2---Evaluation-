/*

Class to apply style to any

*/
import Foundation
import UIKit


class Styles
{
	//======================= Buttons =======================
	
	//- One button -
	func styleUIButtons(button b: UIButton,
						font f: UIFont,
						title t: String,
	                    radius r: CGFloat,
	                    borderWidth bw: CGFloat,
	                    borderColor bc: CGColor,
	                    bgColor bg: CGColor?)
	{
		b.clipsToBounds = true
		b.layer.cornerRadius = r
		b.layer.borderWidth = bw
		b.layer.borderColor = bc
		b.layer.backgroundColor = bg
		b.titleLabel?.font = f
		b.setTitle(t, for: .normal)
		b.titleLabel?.adjustsFontSizeToFitWidth = true
	}
	//--------------
	
	//- Buttons Arrays -
	func styleArrayOfUIButtons(arrayOfButtons ab: [UIButton],
	                           font f: UIFont,
	                           fontColor fc: UIColor,
	                           radius r: CGFloat,
	                           borderWidth bw: CGFloat,
	                           borderColor bc: CGColor,
	                           bgColor bg: CGColor?)
	{
		for b in ab
		{
			b.clipsToBounds = true
			b.layer.cornerRadius = r
			b.layer.borderWidth = bw
			b.layer.borderColor = bc
			b.layer.backgroundColor = bg
			b.titleLabel?.font = f
			b.titleLabel?.textColor = fc
		}
	}
	//------------------
	
	//- Color buttons arrays -
	func styleColorsOfButtons(arrayOfButtons ab: [UIButton],
	                          colors c: CGColor?)
	{
		for b in ab
		{
			b.layer.backgroundColor = c
		}
	}
	//------------------------
	
	//- Alpha buttons arrays -
	func styleAlphaOfButtons(arrayOfButtons ab: [UIButton],
	                         alpha a: CGFloat)
	{
		for b in ab
		{
			b.alpha = a
		}
	}
	//------------------------
	
	//=======================================================
	
	//--- The others ---
	func styleUISegmentedControl(segmentedControl sc: UISegmentedControl,
	                             radius r: CGFloat,
	                             borderWidth bw: CGFloat,
	                             tintColor tc: UIColor,
	                             borderColor bc: CGColor,
	                             bgColor bg: CGColor?)
	{
		sc.clipsToBounds = true
		sc.layer.cornerRadius = r
		sc.layer.borderWidth = bw
		sc.layer.borderColor = bc
		sc.tintColor = tc
		sc.layer.backgroundColor = bg
	}
	
	func styleUITextField(textField tv: UITextField,
	                      font f: UIFont,
	                      radius r: CGFloat,
	                      borderWidth bw: CGFloat,
	                      borderColor bc: CGColor,
	                      bgColor bg: CGColor?)
	{
		tv.clipsToBounds = true
		tv.font = f
		tv.layer.cornerRadius = r
		tv.layer.borderWidth = bw
		tv.layer.borderColor = bc
		tv.layer.backgroundColor = bg
	}
	
	func styleUILabel(label l: UILabel,
					  font f: UIFont,
					  textAlignment ta: NSTextAlignment,
					  radius r: CGFloat,
					  borderWidth bw: CGFloat,
					  borderColor bc: CGColor,
					  bgColor bg: CGColor?)
	{
		l.clipsToBounds = true
		l.font = f
		l.textAlignment = ta
		l.layer.cornerRadius = r
		l.layer.borderWidth = bw
		l.layer.borderColor = bc
		l.layer.backgroundColor = bg
	}
	//------------------
	
	//====================== The views ======================
	func styleUITextViews(textView tv: UITextView,
	                      radius r: CGFloat,
						  font f: UIFont,
	                      textColor tc: UIColor,
						  textAlignment ta: NSTextAlignment,
	                      borderWidth bw: CGFloat,
	                      borderColor bc: CGColor,
	                      bgColor bg: CGColor?)
	{
		tv.clipsToBounds = true
		tv.font = f
		tv.textColor = tc
		tv.textAlignment = ta
		tv.layer.cornerRadius = r
		tv.layer.borderWidth = bw
		tv.layer.borderColor = bc
		tv.layer.backgroundColor = bg
	}
	
	func styleUITableView(tableView tv: UITableView,
	                      radius r: CGFloat,
	                      borderWidth bw: CGFloat,
	                      borderColor bc: CGColor,
	                      bgColor bg: CGColor?)
	{
		tv.clipsToBounds = true
		tv.layer.cornerRadius = r
		tv.layer.borderWidth = bw
		tv.layer.borderColor = bc
		tv.layer.backgroundColor = bg
	}
	
	
    
    func styleUIScrollView(scrollView sv: UIScrollView,
                           radius r: CGFloat,
                           borderWidth bw: CGFloat,
                           borderColor bc: CGColor,
                           bgColor bg: CGColor?)
    {
        sv.clipsToBounds = true
        sv.layer.cornerRadius = r
        sv.layer.borderWidth = bw
        sv.layer.borderColor = bc
		sv.layer.backgroundColor = bg
    }
	
	func styleUIImageView(imageView iv: UIImageView,
	                      radius r: CGFloat,
	                      borderWidth bw: CGFloat,
	                      borderColor bc: CGColor)
	{
		iv.clipsToBounds = true
		iv.layer.cornerRadius = r
		iv.layer.borderWidth = bw
		iv.layer.borderColor = bc
	}
	//=======================================================
}




















