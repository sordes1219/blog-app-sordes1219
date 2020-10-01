module TabsHelper
  def add_active(path)
    'active' if current_page?(path)
  end
end