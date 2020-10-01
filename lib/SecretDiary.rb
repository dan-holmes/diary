class SecretDiary
  attr_reader :entries

  def initialize
    @entries = []
    @locked = false
  end

  def add_entry(entry)
    raise "Please unlock the diary first." if @locked
    @entries.push(entry)
  end

  def get_entries
    raise "Please unlock the diary first." if @locked
    @entries
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end
