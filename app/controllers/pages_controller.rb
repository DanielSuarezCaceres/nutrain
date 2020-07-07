class PagesController < HighVoltage::PagesController
  #include HighVoltage::StaticPage
  skip_before_action :authenticate_user! #no need to be authenticated to see these pages
  layout :layout_for_page


end
