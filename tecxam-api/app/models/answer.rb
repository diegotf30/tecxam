class Answer < ApplicationRecord
  belongs_to :question
  before_save :parse

  alias_attribute :vars, :variables

  OPERATIONS = { 'sin' => 'Math.sin', 'cos' => 'Math.cos', 'tan' => 'Math.tan', 'mod' => '%' }

  def user
    question.user
  end

  def evaluate
    begin
      replace_variables(parsed_name)
      return eval(parsed_name).round(3).to_s
    rescue Exception
      replace_variables(name)
      return name
    end
  end

  private

  def parse
    self.parsed_name = name

    self.parsed_name.gsub!(/(\^)/, '**') # Need special regex, because it's not a word
    OPERATIONS.each do |op, ruby_op|
      self.parsed_name.gsub!(/\b(#{op}|#{op.upcase}|#{op.downcase})\b/, ruby_op)
    end
  end

  def replace_variables(str)
    vars.each do |var, values|
      random_choice = choose_and_save_var(var, values)
      str.gsub!(/\b(#{var}|#{var.upcase}|#{var.downcase})\b/, random_choice.to_s)
    end
  end

  def choose_and_save_var(var, values)
    random_value = eval(values).sample
    self.last_chosen_variables[var] = random_value
    save
    return random_value
  end
end
