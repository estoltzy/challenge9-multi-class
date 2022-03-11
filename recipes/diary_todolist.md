# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
                -
┌──────────────────────────────────────────────┐                ┌─────────────────────────────────────────────────────┐
│                 Diary                        │                │                       TodoList                      │
│                 -----                        │                │                       --------                      │
│                                              │                │                                                     │
│    Initialize                                │                │   Initialize                                        │
│                                              │                │     @tasks = []                                     │
│    add(entry)                                │                │                                                     │
│                                              │                │   add(todo)                                         │
│    select_entry(available_mins, wpm)         │                │                                                     │
│                                              │                │   complete                                          │
│    list_contacts                             │                │                                                     │
│                                              │                │   incomplete                                        │
│    list_entries                              │                │                                                     │
│                                              │                │   delete                                            │
│                                              │                │                                                     │
│                                              │                │                                                     │
│                                              │                │                                                     │
│                                              │                │                                                     │
└──────────────────────────────────────────────┘                └─────────────────────────────────────────────────────┘


┌──────────────────────────────────────────────┐                 ┌───────────────────────────────────────────────────┐
│                                              │                 │                       ToDo                        │
│                DiaryEntry                    │                 │                       ----                        │
│                ----------                    │                 │                                                   │
│                                              │                 │    Initialize(todo)                               │
│  Initialize(title, contents)                 │                 │       @todo = todo                                │
│                             @phone_number =""                  │                                                   │
│  count_words                                 │                 │    todo                                           │
│                                              │                 │                                                   │
│  calculate_reading_time(wpm)                 │                 │    mark_done                                      │
│                                              │                 │                                                   │
│  title                                       │                 │    done?                                          │
│                                              │                 │                                                   │
│  contents                                    │                 │                                                   │
│                                              │                 │                                                   │
│  phone_number?                               │                 │                                                   │
│                                              │                 │                                                   │
│  add_contact(name, phone_num) - hash         │                 │                                                   │
│                                              │                 │                                                   │
│                                              │                 │                                                   │
└──────────────────────────────────────────────┘                 └───────────────────────────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
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

class DiaryEntry
  def initialize(title, contents)
  # needs @title, @contents
  end

  def count_words
  # count the number of words in a diary entry
  end

  def calculate_reading_time(wpm)
  # wpm is assumed to be an integer. 
  # estimates the time taken to read words in entry based on words per minute (wpm)
  end

  def title
  # returns title
  end

  def content
  #return content
  end

  def phone_number?
  # returns true if phone number
  end
end

class TodoList
  def initialize(tasks)
  # @tasks = []
  end

  def add(todo)
   # add instance from Todo class
   # return nothing
  end

  def complete
  # return completed tasks
  end

  def incomplete
  # returns incomplete tasks
  end

  def delete
  # delete completed tasks from todo list
  # returns updated todo list
  end

  def list_todos
  # returns all todos
  end
end

class Todo
  def initialize(todo)
  # @todo = todo
  end

  def todo
  # return todo
  end

  def mark_done
  # mark a todo complete
  end

  def done?
  # returns true if todo is complete
  end
end

class ContactEntry
  def initialize(contact)
  @contact = contact
  end

  def add_contact_details(contact_details)
  # contact is a string including name and phone number
  end

  def contact
  # returns contact
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
diary = Diary.new
first_entry = DiaryEntry.new("my title", "my contents")
second_entry = DiaryEntry.new("another title", "some more contents")
diary.add(first_entry)
diary.add(second_entry)
diary.all_entries # => [first_entry, second_entry]

diary = Diary.new
first_contact = ContactEntry.new("name", "phone number")
second_contact = ContactEntry.new("name2", "phone number2")
diary.add_contact(first_contact)
diary.add_contact(second_contact)
diary.list_contacts # => [first_contact, second_contact]

diary = Diary.new
first_todolist = TodoList.new("todolist1")
second_todolist = TodoList.new("todolist2")
diary.add_todo_list(first_todolist)
diary.add_todo_list(second_todolist)
diary.all_todo_lists # => [first_todolist, second_todolist]

diary = Diary.new
first_entry = DiaryEntry.new("my title", "my contents")
second_entry = DiaryEntry.new("another title", "some more contents")
diary.add(first_entry)
diary.add(second_entry)
diary.select_entry(1, 2) # => first_entry

todolist = TodoList.new
first_todo = Todo.new("Wash the car")
second_todo = Todo.new("Paint the fence")
todolist.add(first_todo)
todolist.add(second_todo)
todolist.list_todos # => [first_todo, second_todo]

todolist = TodoList.new
first_todo = Todo.new("Wash the car")
second_todo = Todo.new("Paint the fence")
todolist.add(first_todo)
todolist.add(second_todo)
todolist.incomplete # => [first_todo, second_todo]

todolist = TodoList.new
first_todo = Todo.new("Wash the car")
second_todo = Todo.new("Paint the fence")
todolist.add(first_todo)
todolist.add(second_todo)
todolist.mark_done(first_todo)
todolist.incomplete # => [second_todo]
todolist.complete # => [first_todo]

todolist = TodoList.new
first_todo = Todo.new("Wash the car")
second_todo = Todo.new("Paint the fence")
todolist.add(first_todo)
todolist.add(second_todo)
todolist.delete(first_todo) # => [second_todo]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Returns title of diary entry
diary_entry = DiaryEntry.new("my title", "my contents")
diary_entry.title # => "my title"

# Returns contents of diary entry
diary_entry = DiaryEntry.new("my title", "my contents")
diary_entry.contents # => "my contents"

# Checks for phone number in contents
diary_entry = DiaryEntry.new("my title", "my contents includes 0123456890")
diary_entry.phone_number? # => true

# Counts the number of words in a diary entry
diary_entry = DiaryEntry.new("my title", "my contents has five words")
diary_entry.count_words # => 5

# Calculates the reading time using wpm
diary_entry = DiaryEntry.new("my title", "my contents has six words wow")
diary_entry.calculate_reading_time(2) # => 3

new_todo = Todo.new("Wash the car")
new_todo.todo # => "Wash the car"

new_todo = Todo.new("Wash the car")
new_todo.mark_done
new_todo.done? # => true

new_contact = ContactEntry.new("Eleanor - 02077367699")
new_contact.contact # => "Eleanor - 02077367699"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
