#needs mutex because of unpredictable context switching 

threads = [] # keep track of threads
lock=Mutex.new
threads << Thread.new do
    lock.synchronize{
    100.times { puts "This is SPARTA" } }
    sleep(10)
end
threads << Thread.new do
    lock.synchronize{
    100.times { puts "THIS IS ABSURD" } }
    sleep(10)
end
threads.each { |thr| thr.join } # wait for each thread to complete
