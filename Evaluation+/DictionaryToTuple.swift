/*
  DictionaryToTuple.swift
  Evaluation+

  Created by Marcos Gomes on 17-12-02.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

import Foundation

class DictionaryToTuple
{
	func dictType1(_ d: [String:[String:[Double]]]) ->
		[(str1: String, arr: [(str2: String, num1: Double, num2: Double, num3: Double)])]
	{
		var tupleToReturn = [(str1: String, arr: [(str2: String, num1: Double, num2: Double, num3: Double)])]()
		/* array to receive the main dictionary keys */
		let arrayDictKey = [String](d.keys)
		/* array to receive the main dictionary values */
		let arrayDictValue = [[String:[Double]]](d.values)
		/* array to receive the Double array */
		var arrayIntern = [(str2: String, num1: Double, num2: Double, num3: Double)]()
		/* variables to receive the Doubles values from Double array */
		var n1: Double = 0; var n2: Double = 0; var n3: Double = 0
		/* the key from secondary dictionary */
		var keyFromValue: String = ""
		
		for dictkey in arrayDictKey
		{
			let mainKey = dictkey		/* Main keys*/
			
			for dictvalue in arrayDictValue
			{
				/* array to receive the dictionary keys of main dictionary values */
				let arrayKeyDictValue = [String](dictvalue.keys)
				
				for KeyDictValue in arrayKeyDictValue
				{
					keyFromValue = KeyDictValue
					/* Doubles array */
					let arrayValueDictValue = [[Double]](dictvalue.values)
					/* the double values */
					for thedictValues in arrayValueDictValue
					{
						let value = thedictValues
						
						n1 = value[0]
						n2 = value[1]
						n3 = value[2]
					}
					arrayIntern.append((keyFromValue, n1, n2, n3))
				}
			}
			tupleToReturn.append((mainKey, arrayIntern))
		}
		return tupleToReturn
	}
}
