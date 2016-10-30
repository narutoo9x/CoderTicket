module EventsHelper
  def header_background_image_url
    "https://az810058.vo.msecnd.net/site/global/Content/img/home-search-bg-0#{rand(6)}.jpg"
  end

  def is_creator_of?(event)
  	if current_user
  		current_user.id == event.user_id
  	else
  		false
  	end
  end

end
