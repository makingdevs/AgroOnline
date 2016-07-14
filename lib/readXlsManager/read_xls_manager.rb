require 'singleton'

class ReadXlsManager
  include Singleton

  def readExcel(file)
    resultCell= []
    workbook = RubyXL::Parser.parse(file)
    workbook[0].each_with_index { |row,index|
      resultRow = []
      if index != 0
        row.cells.each { |cell|
          val = cell && cell.value
          resultRow << val
        }
      resultCell << resultRow
      end
    }
    resultCell
  end

end
