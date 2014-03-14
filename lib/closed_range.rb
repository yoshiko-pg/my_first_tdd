class ClosedRange

	def initialize(min, max)
		
		if min.class.to_s != 'Fixnum' || max.class.to_s != 'Fixnum'
			raise ArgumentError, '引数が整数型でない'
		elsif max < min
	 		raise ArgumentError, '下端点より上端点が小さい'
	 	end


		@min = min
		@max = max

	end

	def lower_end_point
		@min
	end

	def upper_end_point
		@max
	end

	def to_s
		"[#{@min},#{@max}]"
	end

end
