//
//  DictionaryToTuple.swift
//  Evaluation+
//
//  Created by Marcos Gomes on 17-12-02.
//  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
//

import Foundation

class DictionaryToTuple
{
	func dictType1(dict d: [String:[String:[Double]]]) ->
		[(str1: String, arr: [(str2: String, num1: Double, num2: Double, num3: Double)])]
	{
		var tupleToReturn = [(str1: String, arr: [(str2: String, num1: Double, num2: Double, num3: Double)])]()
		/* array to receive the main dictionary keys */
		let arrayDictKey = [String](d.keys)
		/* array to receive the main dictionary values */
		let arrayDictValue = [[String:[Double]]](d.values)
		
		var i = 0; while i < d.count
		{
			tupleToReturn[i].str1 = arrayDictKey[i]			 /* Main keys*/
			
			for j in 0..<arrayDictValue.count
			{
				/* array to receive the dictionary keys of main dictionary values */
				let keyDictValue = [String](arrayDictValue[j].keys)
				/* array to receive the dictionary values of main dictionary values */
				let valueDictValue = [[Double]](arrayDictValue[i].values)
				/* secondary keys */
				tupleToReturn[i].arr[j].str2 = keyDictValue[j]
				/* secondary values */
				tupleToReturn[i].arr[j].num1 = valueDictValue[0][j]
				tupleToReturn[i].arr[j].num2 = valueDictValue[0][j + 1]
				tupleToReturn[i].arr[j].num3 = valueDictValue[0][j + 2]
			}
			i = i + 1
		}
		
		return tupleToReturn
	}
	
	
}
