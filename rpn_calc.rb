class RPN_calc

  def calc(task)
    return 0 if task == ""

    stack = []
    elements = task.split(' ').map!{|e| e.gsub(/^[a-zA-Z]*$/,'')}.reject(&:empty?)
    if elements.any?{|i| i =~ /^\d+$/?true:false}


    elements.each do |e|
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
       "Kurwa! Seems that's not proper polish notation. Try again!"
     end

    end
    stack.pop

    else
      "Kurwa! Seems that's not proper polish notation. Try again!"
    end
  end

  def toniller(num, counter)
    binary = "%b" % num
    binary.split("").reverse!.map!{|e| e =="1" && counter !=0 ? (counter -=1;e="0") : e }.reverse!.join.to_i(base=2)
  end
end






