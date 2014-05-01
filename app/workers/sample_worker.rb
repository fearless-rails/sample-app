class SampleWorker
  @queue = :sample

  def self.perform
    puts "I'm a sample worker. Pretend I did something cool here, ok?"
    sleep 3
  end
end