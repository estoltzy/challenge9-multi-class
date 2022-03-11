require 'diary'
require 'diary_entry'
require 'todo'
require 'todolist'
require 'contact_entry'

RSpec.describe 'Diary Integration' do
  it 'adds diary entries and returns them' do
    diary = Diary.new
    first_entry = DiaryEntry.new("my title", "my contents")
    second_entry = DiaryEntry.new("another title", "some more contents")
    diary.add(first_entry)
    diary.add(second_entry)
    expect(diary.all_entries).to eq [first_entry, second_entry]
  end

  it 'adds contacts and lists them' do
    diary = Diary.new
    first_contact = ContactEntry.new("name - phone number")
    second_contact = ContactEntry.new("name - phone number2")
    diary.add_contact(first_contact)
    diary.add_contact(second_contact)
    expect(diary.list_contacts).to eq [first_contact, second_contact]
  end

  it 'adds a todo list and returns all todo lists' do
    diary = Diary.new
    first_todolist = TodoList.new
    second_todolist = TodoList.new
    diary.add_todo_list(first_todolist)
    diary.add_todo_list(second_todolist)
    expect(diary.all_todo_lists).to eq [first_todolist, second_todolist]
  end

  it 'selects a diary entry based on available time and wpm' do
    diary = Diary.new
    first_entry = DiaryEntry.new("my title", "my contents")
    second_entry = DiaryEntry.new("another title", "some more contents")
    diary.add(first_entry)
    diary.add(second_entry)
    expect(diary.select_entry(1, 2)).to eq [first_entry]
  end
end







