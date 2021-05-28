class BotInfo
  def self.bot
    @@bot ||= Telegram.bot.get_me['result']
  end

  def self.name
    @@name ||= bot['first_name']
  end
end
