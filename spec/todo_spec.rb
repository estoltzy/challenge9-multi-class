require 'todo'

RSpec.describe 'todo method' do
  it 'creates a new todo' do
    new_todo = Todo.new("Wash the car")
    expect(new_todo.todo).to eq "Wash the car"
  end

  it 'returns true if a todo is complete' do
    new_todo = Todo.new("Wash the car")
    new_todo.mark_done
    expect(new_todo.done?).to eq true
  end
end