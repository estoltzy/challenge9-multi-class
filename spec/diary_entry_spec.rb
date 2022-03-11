require 'diary_entry'

RSpec.describe 'diary entry method' do
  it 'returns the title of a diary entry' do
    diary_entry = DiaryEntry.new("my title", "my contents")
    expect(diary_entry.title).to eq "my title"
  end

  it 'returns the contents of a diary entry' do
    diary_entry = DiaryEntry.new("my title", "my contents")
    expect(diary_entry.contents).to eq "my contents"
  end

  it 'returns true if a phone number exists in the contents' do
    diary_entry = DiaryEntry.new("my title", "0123456890")
    expect(diary_entry.phone_number?).to eq true
  end

  it 'counts the number of words in a diary entry' do
    diary_entry = DiaryEntry.new("my title", "my contents has five words")
    expect(diary_entry.count_words).to eq 5
  end

  it 'calculates the reading time using wpm' do
    diary_entry = DiaryEntry.new("my title", "my contents has six words wow")
    expect(diary_entry.calculate_reading_time(2)).to eq 3
  end
end
