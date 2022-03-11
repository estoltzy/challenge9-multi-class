require_relative 'diary_entry'
require_relative 'todolist'
require_relative 'todo'
require_relative 'contact_entry'

class Diary
  def initialize 
    @entries = []
    @contact_info = []
    @phone_numbers = []
    @todo_lists = []
  end

  def add(entry)
    @entries << entry
  end

  def all_entries
    return @entries
  end

  def add_contact(contact)
    @contact_info << contact
  end

  def list_contacts
    return @contact_info
  end

  def add_phone_numbers(number)
    @phone_numbers << number
  end

  def phone_numbers
    return @phone_numbers
  end

  def add_todo_list(todo_list)
    @todo_lists << todo_list
  end

  def all_todo_lists
    return @todo_lists
  end

  def select_entry(minutes, wpm)
  # wpm stands for words per minute, assumed integer input
  # available_mins assumed integer input
  # choose an entry based on how much time the reader has and their reading speed
    readable_entries = @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes  
    end
  #   sorted_by_longest = readable_entries.sort_by do |entry|
  #     entry.count_words
  #   end
  # sorted_by_longest.last
  end
end