Runner := Object clone
Runner hello := method("Hello world!" println)
Runner run := method(toRun, self getSlot(toRun) call)