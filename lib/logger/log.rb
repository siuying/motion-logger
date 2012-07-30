module LoggerClassMethods
  FLAGS = {
    :error    => (1<<0),   # 0...0001
    :warn     => (1<<1),    # 0...0010
    :info     => (1<<2),    # 0...0100
    :verbose  => (1<<3), # 0...1000
    :debug    => (1<<3)    # 0...1000
  }
  
  LEVELS = {
    :off      => 0,
    :error    => FLAGS[:error],
    :warn     => FLAGS[:error] | FLAGS[:warn],
    :info     => FLAGS[:error] | FLAGS[:warn] | FLAGS[:info],
    :verbose  => FLAGS[:error] | FLAGS[:warn] | FLAGS[:info] | FLAGS[:verbose],
    :debug    => FLAGS[:error] | FLAGS[:warn] | FLAGS[:info] | FLAGS[:verbose]
  }

  def level=(level)
    @level = level
  end
  
  def level
    @level
  end

  def async=(async)
    @async = async
  end
  
  def async
    @async
  end

  def error(message)
    __log(:error, message)
  end

  def warn(message)
    __log(:warn, message)
  end
  
  def info(message)
    __log(:info, message)
  end
  
  def debug(message)
    __log(:verbose, message)
  end
  alias_method :verbose, :debug
  
  def logging?(flag)
    (LEVELS[level] & FLAGS[flag]) > 0
  end

  protected
  def __log(flag, message)
    return unless logging?(flag)
    raise ArgumentError, "flag must be one of #{FLAGS.keys}" unless FLAGS.keys.include?(flag)
    async_enabled = self.async || (self.level == :error)
    message = message.gsub('%', '%%')

    log(async_enabled, 
      level:LEVELS[level], 
      flag:FLAGS[flag], 
      context:0, 
      file:__FILE__, 
      function:__method__, 
      line:__LINE__, 
      tag:0, 
      format:message)
  end
end

module Motion
  class Log < ::DDLog
    class << self
      alias_method :flush, :flushLog
    end

    extend LoggerClassMethods

    @async = true
    @level = :info
  end
end