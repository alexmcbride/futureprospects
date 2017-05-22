# Fake Twilio client for development, just dumps any SMS messaqes to the debug output.
class FakeTwilioClient
  def messages
    Messages.new
  end

  # Helper class for logging messages.
  class Messages
    # Helper class for creating messages.
    #
    # @param args [Hash] the args used when sending a message.
    def create(args={})
      puts '---- SMS ----'
      puts "From: #{args[:from]}"
      puts "To: #{args[:to]}"
      puts "Body: #{args[:body]}"
      puts '---- END ----'
    end
  end
end
