class Ta_Api
	validates_presence_of :id, :question, :email, :name, :slack_username

  def ta_patch(issue_id, resolution)
    response = HTTParty.patch("https://devcamp.com/hand_raises/#{issue_id}/?hand_raise[#{resolution}]")
    puts response
  end

  def ta_post(text)
    options = { :body => {:status => text}, :basic_auth => @auth }
    self.class.post('/statuses/update.json', options)
  end
end