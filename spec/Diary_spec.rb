require "Diary"
require "DiaryLock"

describe Diary do
  before(:each) do
    @diary = Diary.new
  end

  it "can add and get entries" do
    @diary.add_entry("This is my entry.")
    expect(@diary.get_entries).to eq ["This is my entry."]
  end

  it "cannot add or get entries when locked" do
    @diary.padlock.lock
    expect { @diary.add_entry("This is my entry.") }.to raise_error "Please unlock the diary first."
    expect { @diary.get_entries }.to raise_error "Please unlock the diary first."
  end

  it "doesn't error when locked and unlocked again" do
    @diary.padlock.lock
    @diary.padlock.unlock
    expect { @diary.add_entry("This is my entry.") }.not_to raise_error
    expect { @diary.get_entries }.not_to raise_error
  end
end
