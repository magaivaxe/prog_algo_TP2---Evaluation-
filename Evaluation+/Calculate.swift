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
		var arrayPonderation = [Double]()
		var total: Double!
		let sumWeights = w.reduce(0, +)					/* Sum all weight numbers */
		
		var i = 0; while i < c.count					/* Average weighted */
		{
			arrayPonderation.append((c[i] * w[i]) / sumWeights)
			
			i = i + 1
		}
		total = (((arrayPonderation.reduce(0, +)) * 10).rounded()) / 10
		
		return total
	}
	
	func arrayGradeWithWeight(criterias c: [Double],
						 weights w: [Double],
						 gradeOn g: Int) -> [Double]
	{
		var arrayGradeOn: [Double]!
		var arrayPonderation: [Double]!
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
			arrayPonderation[i] = ((arrayGradeOn[i] * w[i]) / sumWeights).rounded()
			
			i = i + 1
		}
		
		return arrayPonderation
	}
	
	func gradeWithGradeOn(criterias c: Double,
						 gradeOn g: Int) -> Double
	{
		var criteriaWeight: Double!
		
		if g == 30
		{
			criteriaWeight = (((c * 30 / 5) * 10).rounded()) / 10			/* Apply the grade On */
		}
		if g == 100
		{
			criteriaWeight = (((c * 100 / 5) * 10).rounded()) / 10
		}
		
		
		return criteriaWeight
	}
}
