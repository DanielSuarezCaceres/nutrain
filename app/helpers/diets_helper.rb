module DietsHelper

  def check_diet_routes(client_id, diet)
    if client_id && diet.new_record?
      {url: user_client_diets_path(user_id: current_user.id, client_id: client_id), method: :post}
    elsif client_id
      {url: user_client_diet_path(user_id: current_user.id, client_id: client_id, diet: diet), method: :put}
    elsif client_id.nil? && diet.new_record?
      {url: user_diets_path(user_id: current_user.id, id: diet), method: :post}
    else client_id.nil?
      {url: user_diet_path(user_id: current_user.id, id: diet), method: :put}
    end
  end

end
