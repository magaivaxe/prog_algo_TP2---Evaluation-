//
//  Calculate.swift
//  Evaluation+
//
//  Created by Marcos Gomes on 17-11-29.
//  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
//

import Foundation

class Calculate
{
	func totalGradeWithWeight(criterias c: [Double],
							  weights w: [Double],
							  gradeOn g: Int) -> Double
	{
		var arrayGradeOn: [Double]!
		var arrayPonderation: [Double]!
		var total: Double!
		let sumWeights = w.reduce(0, +)					/* Sum all weight numbers */
		
		if g == 30
		{
			arrayGradeOn = c.map({$0 * 30 / 5})			/* Apply the grade On */
		}
		if g == 100
		{
			arrayGradeOn = c.map({$0 * 100 / 5})
		}
		
		var i = 0; while 1 < c.count					/* Average weighted */
		{
			arrayPonderation[i] = (arrayGradeOn[i] * w[i]) / sumWeights
			
			i = i + 1
		}
		total = (((arrayPonderation.reduce(0, +)) * 10).rounded()) / 0.1
		
		return total
	}
}
