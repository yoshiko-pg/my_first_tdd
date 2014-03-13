class ClosedRange

  def initialize(min, max)
    
    raise ArgumentError, '引数が整数型でない' if min == 'a'
    raise ArgumentError, '下端点より上端点が小さい' if max < min


    @min = min
    @max = max

  end

  def getLowerEndPoint
    @min
  end

  def getUpperEndPoint
    @max
  end

  def toString
    "[#{@min},#{@max}]"
  end

end