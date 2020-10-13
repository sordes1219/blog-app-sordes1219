module TabsHelper
  def add_active(path)
    path = path.split('?').first
    'active' if current_page?(path)
  end
end