require_relative 'diary_entry'
require_relative 'todolist'
require_relative 'todo'
require_relative 'contact_entry'

class Diary
  def initialize # global variables here. Will need an empty array for entries.
  @contact_info = []
  end

  def add(entry)
  # add an instance from DiaryEntry class
  end

  def all_entries
  # returns all diary entries
  end

  def add_contact(contact)
  # add an instance from ContactEntry class. Store in @contact_info hash
  end

  def list_contacts
  # return @contact_info
  end

  def add_todo_list(todo_list)
  # adds an instance of TodoList to the diary
  end

  def all_todo_lists
  # returns all todo lists in the diary
  end

  def select_entry(available_mins, wpm)
  # wpm stands for words per minute, assumed integer input
  # available_mins assumed integer input
  # choose an entry based on how much time the reader has and their reading speed
  end
end