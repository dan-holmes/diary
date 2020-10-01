require "SecretDiary"

describe SecretDiary do
  # Arrange
  before(:each) do
    @diary = SecretDiary.new
  end

  it "can add and get entries" do
    # Act
    @diary.add_entry("This is my entry.")

    # Assert
    expect(@diary.get_entries).to eq ["This is my entry."]
  end

  it "cannot add or get entries when locked" do
    # Act
    @diary.lock

    # Assert
    expect { @diary.add_entry("This is my entry.") }.to raise_error "Please unlock the diary first."
    expect { @diary.get_entries }.to raise_error "Please unlock the diary first."
  end

  it "doesn't error when locked and unlocked again" do
    # Act
    @diary.lock
    @diary.unlock

    # Arrange
    expect { @diary.add_entry("This is my entry.") }.not_to raise_error
    expect { @diary.get_entries }.not_to raise_error
  end
end
