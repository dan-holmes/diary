require "SecretDiary"

describe SecretDiary do
  it "can add an entry" do
    # Arrange
    diary = SecretDiary.new

    # Act
    diary.add_entry("This is my entry.")

    # Assert
    expect(diary.entries[0]).to eq "This is my entry."
  end

  it "can get entries" do
    # Arrange
    diary = SecretDiary.new

    # Act
    diary.add_entry("This is my entry.")

    # Assert
    expect(diary.get_entries).to eq ["This is my entry."]
  end

  it "cannot add entries when locked" do
    # Arrange
    diary = SecretDiary.new

    # Act
    diary.lock

    # Assert
    expect { diary.add_entry("This is my entry.") }.to raise_error "Please unlock the diary first."
  end

  it "cannot get entries when locked" do
    # Arrange
    diary = SecretDiary.new

    # Act
    diary.lock

    # Assert
    expect { diary.get_entries }.to raise_error "Please unlock the diary first."
  end

  it "doesn't error when locked and unlocked again" do
    # Arrange
    diary = SecretDiary.new

    # Act
    diary.lock
    diary.unlock

    # Arrange
    expect { diary.add_entry("This is my entry.") }.not_to raise_error
    expect { diary.get_entries }.not_to raise_error
  end
end
