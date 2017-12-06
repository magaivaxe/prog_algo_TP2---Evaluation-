/*

Class to save and load files

*/

//-- Libraries --
import Foundation
//---------------

class SaveLoadMenager
{
	//-- If exist the file --
	func checkExistingSaves(fileName: String) -> Bool
	{
		if UserDefaults.standard.object(forKey: fileName) == nil
		{
			return false
		}
		return true
	}
	//-----------------------
	//---- Save the file ----
	func saveData(theData: AnyObject, fileName: String)
	{
		UserDefaults.standard.set(theData, forKey: fileName)
	}
	//-----------------------
	//----- Delete file -----
	func deleteFile(fileName: String)
	{
		UserDefaults.standard.removeObject(forKey: fileName)
	}
	//-----------------------
	//------ Load file ------
	func loadData(fileName: String) -> AnyObject
	{
		return UserDefaults.standard.object(forKey: fileName) as AnyObject
	}
	//-----------------------
}


