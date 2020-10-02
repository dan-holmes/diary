class DiaryLock
  def initialize
    @locked = false
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def check_unlocked
    raise "Please unlock the diary first." if @locked
    unlocked = !@locked
  end
end
