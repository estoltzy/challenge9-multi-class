class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def count_words
    @contents.split(" ").count
  end

  def calculate_reading_time(wpm)
  # wpm is assumed to be an integer. 
    words = @contents.split(" ")
    (words.length / wpm.to_f).ceil    
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def phone_number?
    @contents.is_a? Integer
    return true
  end
end