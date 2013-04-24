class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "DIES-IST-EIN-TEST: #{message.to} #{message.subject}"
    message.to = `git config user.email`.chomp
  end
end

