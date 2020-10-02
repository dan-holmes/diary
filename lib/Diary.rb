class Diary
  attr_accessor :padlock

  def initialize
    @entries = []
    @padlock = DiaryLock.new
  end

  def add_entry(entry)
    @entries.push(entry) if @padlock.check_unlocked
  end

  def get_entries
    @entries if @padlock.check_unlocked
  end
end
