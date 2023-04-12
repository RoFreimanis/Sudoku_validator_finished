class NoRepeatingDigits
  def initialize()
    @digits = Array.new(9)
  end
    def addDigit(digit)
      if(@digits[digit-1]) 
        return false
      else
        @digits[digit-1] = true
      end
      return true
  end

end

def stringTo2DArray(string)
  arr = Array.new(9){Array.new(9)}
  i = 0
  string.each_line do |line| 
  line = line.delete  "|" 
  
  
  if(line[0] != '-') 
    arr[i] = line.split(' ')
   i=i+1
  end
 
end
return arr
end




class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    # Your code here
    isIncomplete = false
    #Converting puzzle string to 2D array
    arr = stringTo2DArray(@puzzle_string)
    #Checking for repeating digits in rows
    for row in 0..8 do
      checkDigits = NoRepeatingDigits.new()
      for col in 0..8 do
        #Checking for forbidden characters
        digit = (arr[row][col]).to_i
        if(digit.to_s != arr[row][col] || digit<0 || digit > 9)
          return "Sudoku is invalid."
        end
        if(digit == 0) 
          isIncomplete = true

      elsif (!checkDigits.addDigit(digit))
        "Sudoku is invalid."
        end
      end
    end

    #Checking for repeating digits in columns
    for col in 0..8 do
      checkDigits = NoRepeatingDigits.new()
      for row in 0..8 do
        digit = (arr[row][col]).to_i
        if(digit.to_s != arr[row][col] || digit<0 || digit > 9)
          return "Sudoku is invalid."
        end
        if(digit == 0) 
          isIncomplete = true

      elsif (!checkDigits.addDigit(digit))
          return "Sudoku is invalid."
        end
      end
    end

    #Checking for repeating digits in sub-squares
    (0..8).step(3).each do |row|
      (0..8).step(3).each do |col|
        checkDigits = NoRepeatingDigits.new()
        (row..row+2).each do |r|
          (col..col+2).each do |c|
            digit = (arr[r][c]).to_i
            if(digit == 0) 
              isIncomplete = true
    
          elsif (!checkDigits.addDigit(digit))
            return "Sudoku is invalid."

          end
        end
        
        end
      end
    end


if(isIncomplete) 
  return "Sudoku is valid but incomplete."
else return "Sudoku is valid."
end
 


    
end
end











