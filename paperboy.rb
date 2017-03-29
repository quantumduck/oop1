class PaperBoy

  attr_reader :name
  attr_reader :experience
  attr_reader :earnings

  def initialize(name)
    @name = name.to_s
    @experience = 0
    @earnings = 0
  end

  def quota
    50 + (@experience / 2)
  end

  def deliver(start_address, end_address)
    num_houses = (start_address - end_address).abs + 1
    if (num_houses < self.quota)
      delivery_income = 25 * num_houses - 200
    else
      delivery_income = 25 * self.quota + 50 * (num_houses - self.quota)
    end
    @experience += num_houses
    @earnings += delivery_income
    (delivery_income.to_f / 100.0).round(2)
  end

  def report
    puts "I'm #{@name}, I've delivered #{@experience} papers,"\
         " and I've earned #{@earnings.to_money(:cents)} so far."
  end

end

class Integer
  def to_money(unit = :dollars)
    if (unit == :cents)
      if (self %10 == 0)
        suff = "0"
      else
        suff = ""
      end
      amount = "$" + (self.to_f / 100.00).round(2).to_s + suff
    else
      amount = "$" + self.to_s + ".00"
    end
    amount
  end
end

class Float
  def to_money
    amount = self.round(2)
    if ((100 * amount).to_i % 10 == 0)
      suff = "0"
    else
      suff = ""
    end
    amount = "$" + amount.to_s + suff
  end
end
