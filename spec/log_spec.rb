describe "Motion::Log" do
  Log = Motion::Log

  before do
    @file_logger = DDFileLogger.new
    @file_logger.rollingFrequency = 60 * 60 * 24
    @file_logger.logFileManager.maximumNumberOfLogFiles = 1
    Log.addLogger @file_logger    
  end

  after do
    Log.flush
    @file_logger.logFileManager.unsortedLogFilePaths.each do |file|
      File.delete(file)
    end
    Log.removeAllLoggers
  end

  describe "FileLogger" do
    it "should log with specific levels" do
      Log.level = :warn

      Log.info "Hello World"
      Log.warn "WARNING!"

      Log.level = :info
      Log.info "Foo"
      Log.debug "Lah"
      Log.flush

      file = @file_logger.logFileManager.sortedLogFilePaths.first
      logs = open(file).read
      logs.should.not.be.nil
      logs.should.not.include "Hello World"
      logs.should.include "WARNING!"
      logs.should.include "Foo"
      logs.should.not.include "Lah"
    end
  end

end
