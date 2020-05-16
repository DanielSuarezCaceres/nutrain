module RoutinesHelper

  def check_routine_routes(client_id, routine)
    if client_id && routine.new_record?
      {url: user_client_routines_path(user_id: current_user.id, client_id: client_id), method: :post}
    elsif client_id
      {url: user_client_routine_path(user_id: current_user.id, client_id: client_id, routine: routine), method: :patch}
    elsif client_id.nil? && routine.new_record?
      {url: user_routines_path(user_id: current_user.id, id: routine), method: :post}
    else client_id.nil?
      {url: user_routine_path(user_id: current_user.id, id: routine), method: :patch}
    end
  end
  
end
