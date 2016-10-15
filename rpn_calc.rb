class RPN_calc

  def calc(task)

    elements = clean_string(task)
    stack = []
    Array(elements).each do |e|

      if !(%w[* - + / ** !].include?(e))
        stack.push e.to_f
        next
      end
      puts stack.length
     if stack.size >= 2
        b = stack.pop
        a = stack.pop

       case e
         when "*"
           stack.push a * b
         when "-"
           stack.push a - b
         when "+"
           stack.push a + b
         when "/"
           stack.push a / b
         when "**"
           stack.push a ** b
         when "!"
           stack.push toniller(a, b)
       end

     else
       "Kurwa! Seems that's not proper polish notation. Try again !"
     end

    end

    stack.pop
  end

  def clean_string(string)
    elements = string.split(' ').map!{|e| e.gsub(/[a-zA-ZА-Яа-я()]/u,'')}.reject(&:empty?)
    elements = elements.map!{|e| e.gsub(',' ,'.')}
    if elements.any?{|i| i =~ /(\d+(\.\d+)?)/?true:false}
      return elements
    else
      "Kurwa! Seems that's not proper polish notation. Try again !"
    end
    rescue "Error!"
  end

  def toniller(num, counter)
    counter = counter.round
    binary = "%b" % num
    binary.split("").reverse!.map!{|e| e =="1" && counter !=0 ? (counter -=1;e="0") : e }.reverse!.join.to_i(base=2)
  end
end






