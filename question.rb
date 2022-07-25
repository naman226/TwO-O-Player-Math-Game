class Question

  attr_accessor :problem

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @problem = "What does #{@num1} plus #{@num2} equal?"
  end

  def is_correct(num)
    if num == @num1 + @num2
      p "i got this right"
      true
    else
      false
    end
  end

end

