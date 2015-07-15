module ApplicationHelper
  #Helper para altomatizar uma navbar
  def nav_bar
    content_tag(:ul, class: "nav navbar-nav") do
      yield
    end
  end

  #cria os links da navbar dentro da tag li
  def nav_link(text, path)
    #seta como ativo o link para o controller ativo
    options = current_page?(path) ? { class: "active" } : {}
    content_tag(:li, options) do
      link_to text, path
    end
  end
end
