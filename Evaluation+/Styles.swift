/*

Class to apply style to any

*/
import Foundation
import UIKit


class Styles
{
	//======================= Buttons =======================
	//- One button -
	func styleUIButtons(_ button: UIButton,
						_ title: String?,
						_ fontName: UIFont?,
						_ fontColor: UIColor?,
						_ radius: CGFloat?,
						_ borderWidthN: CGFloat?,
						_ borderColorN: CGColor?,
						_ bgroundColor: CGColor?,
						_ alphaN: CGFloat?)
	{
		button.clipsToBounds = true
		button.layer.cornerRadius = radius!
		button.layer.borderWidth = borderWidthN!
		button.layer.borderColor = borderColorN!
		button.layer.backgroundColor = bgroundColor!
		button.titleLabel?.font = fontName!
		button.setTitle(title!, for: .normal)
		button.titleLabel?.adjustsFontSizeToFitWidth = true
	}
	//--------------
	//- Buttons Arrays -
	func styleArrayOfUIButtons(_ buttons: [UIButton],
	                           _ fontN: UIFont?,
	                           _ fontColor: UIColor?,
	                           _ radius: CGFloat,
	                           _ borderWidthN: CGFloat,
	                           _ borderColorN: CGColor?,
	                           _ bgroundColor: CGColor?,
							   _ alphaN: CGFloat)
	{
		for b in buttons
		{
			b.clipsToBounds = true
			b.layer.cornerRadius = radius
			b.layer.borderWidth = borderWidthN
			b.layer.borderColor = borderColorN!
			b.layer.backgroundColor = bgroundColor!
			b.titleLabel?.font = fontN!
			b.titleLabel?.textColor = fontColor!
			b.alpha = alphaN
		}
	}
	//------------------
	//=======================================================
	//--- The others ---
	func styleUISegmentedControl(_ sControl: UISegmentedControl,
	                             _ radius: CGFloat?,
	                             _ borderWidthN: CGFloat?,
	                             _ tintColorN: UIColor?,
	                             _ borderColorN: CGColor?,
	                             _ bgroundColor: CGColor?)
	{
		sControl.clipsToBounds = true
		sControl.layer.cornerRadius = radius!
		sControl.layer.borderWidth = borderWidthN!
		sControl.layer.borderColor = borderColorN!
		sControl.tintColor = tintColorN!
		sControl.layer.backgroundColor = bgroundColor!
	}
	
	func styleUITextField(_ textField: UITextField,
	                      _ fontN: UIFont?,
						  _ placeH: String?,
	                      _ radius: CGFloat?,
	                      _ borderWidthN: CGFloat?,
	                      _ borderColorN: CGColor?,
	                      _ bgroundColor: CGColor?)
	{
		textField.clipsToBounds = true
		textField.font = fontN!
		textField.placeholder = placeH!
		textField.layer.cornerRadius = radius!
		textField.layer.borderWidth = borderWidthN!
		textField.layer.borderColor = borderColorN!
		textField.layer.backgroundColor = bgroundColor!
	}
	
	func styleArrayOfUITextField(_ textField:[UITextField],
								 _ fontN: UIFont?,
								 _ radius: CGFloat?,
								 _ borderWidthN: CGFloat?,
								 _ borderColorN: CGColor?,
								 _ bgroundColor: CGColor?)
	{
		for tf in textField
		{
			tf.clipsToBounds = true
			tf.font = fontN!
			tf.layer.cornerRadius = radius!
			tf.layer.borderWidth = borderWidthN!
			tf.layer.borderColor = borderColorN!
			tf.layer.backgroundColor = bgroundColor!
		}
	}
	
	func styleUILabel(_ label: UILabel,
					  _ fontN: UIFont?,
					  _ textAlignmentT: NSTextAlignment?,
					  _ textN: String?,
					  _ radius: CGFloat?,
					  _ borderWidthN: CGFloat?,
					  _ borderColorN: CGColor?,
					  _ bgroundColor: CGColor?)
	{
		label.clipsToBounds = true
		label.font = fontN!
		label.textAlignment = textAlignmentT!
		label.text = textN!
		label.layer.cornerRadius = radius!
		label.layer.borderWidth = borderWidthN!
		label.layer.borderColor = borderColorN!
		label.layer.backgroundColor = bgroundColor!
	}
	
	func styleArrayOfUILabel(_ label: [UILabel],
							 _ fontN: UIFont?,
							 _ textAlignmentT: NSTextAlignment?,
							 _ radius: CGFloat?,
							 _ borderWidthN: CGFloat?,
							 _ borderColorN: CGColor?,
							 _ textColor: UIColor?,
							 _ bgroundColor: CGColor?)
	{
		for l in label
		{
			l.clipsToBounds = true
			l.font = fontN!
			l.textAlignment = textAlignmentT!
			l.layer.cornerRadius = radius!
			l.layer.borderWidth = borderWidthN!
			l.textColor = textColor!
			l.layer.borderColor = borderColorN!
			l.layer.backgroundColor = bgroundColor!
		}
	}
	//------------------
	//====================== The views ======================
	func styleUITextViews(_ textView: UITextView,
	                      _ radius: CGFloat?,
						  _ fontN: UIFont?,
						  _ textN: String?,
	                      _ textColor: UIColor?,
						  _ textAlignmentT: NSTextAlignment?,
						  _ borderWidthN: CGFloat?,
						  _ borderColorN: CGColor?,
						  _ bgroundColor: CGColor?)
		
	{
		textView.clipsToBounds = true
		textView.font = fontN!
		textView.textColor = textColor!
		textView.textAlignment = textAlignmentT!
		textView.layer.cornerRadius = radius!
		textView.layer.borderWidth = borderWidthN!
		textView.layer.borderColor = borderColorN!
		textView.layer.backgroundColor = bgroundColor!
	}
	
	func styleUITableView(_ tableView: UITableView,
	                      _ radius: CGFloat?,
	                      _ borderWidthN: CGFloat?,
						  _ borderColorN: CGColor?,
						  _ bgroundColor: CGColor?)
	{
		tableView.clipsToBounds = true
		tableView.layer.cornerRadius = radius!
		tableView.layer.borderWidth = borderWidthN!
		tableView.layer.borderColor = borderColorN!
		tableView.layer.backgroundColor = bgroundColor!
	}
	
    func styleUIScrollView(_ scrollView: UIScrollView,
                           _ radius: CGFloat?,
						   _ borderWidthN: CGFloat?,
						   _ borderColorN: CGColor?,
						   _ bgroundColor: CGColor?)
    {
        scrollView.clipsToBounds = true
        scrollView.layer.cornerRadius = radius!
        scrollView.layer.borderWidth = borderWidthN!
        scrollView.layer.borderColor = borderColorN!
		scrollView.layer.backgroundColor = bgroundColor!
    }
	
	func styleUIImageView(_ imageView: UIImageView,
						  _ imageI: UIImage?,
						  _ radius: CGFloat,
						  _ borderWidthN: CGFloat,
						  _ borderColorN: CGColor?)
	{
		imageView.clipsToBounds = true
		imageView.image = imageI!					/* UIImage(named: "name")*/
		imageView.layer.cornerRadius = radius
		imageView.layer.borderWidth = borderWidthN
		imageView.layer.borderColor = borderColorN
	}
	
	func styleArrayOfImageViews(_ imageView: [UIImageView],
								_ imageNames: [String]?,
								_ radius: CGFloat?,
								_ borderWidthN: CGFloat?,
								_ borderColorN: CGColor?)
	{
		var i = 0
		for iv in imageView
		{
			iv.image = UIImage(named: imageNames![i]); i = i + 1
			iv.layer.cornerRadius = radius!
			iv.layer.borderWidth = borderWidthN!
			iv.layer.borderColor = borderColorN!
		}
	}
	
	func styleUIView(_ view: UIView,
					 _ radius: CGFloat?,
					 _ borderWidthN: CGFloat?,
					 _ borderColorN: CGColor?,
					 _ bgroundColor: UIColor?,
					 _ alphaN: CGFloat?)
	{
		view.layer.cornerRadius = radius!
		view.layer.borderWidth = borderWidthN!
		view.layer.borderColor = borderColorN!
		view.backgroundColor = bgroundColor!
		view.alpha = alphaN!
	}
	//=======================================================
}




















