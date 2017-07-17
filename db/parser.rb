module Parser
  def self.parse(file)
    deck = []
    File.open(file, 'r').each_slice(3) do |slice|
      card = {}
      card[:question] = slice[0].chomp
      card[:answer] = slice[1].chomp
      deck << card
    end
    deck
  end
end
