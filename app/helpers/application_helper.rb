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
  
  def dropdown(text, control)
    options = (controller.controller_name == control) ? { class: "active dropdown" } : {class: "dropdown"}
    content_tag(:li, options) do
      link_to(text, class: "dropdown-toggle",
              data: {toggle: "dropdown"}, role: "button",
              aria: {haspopup: "true", expended: "false"}) do 
                "#{text} <span class='caret'></span>".html_safe
              end +
      content_tag(:ul, class: "dropdown-menu") do
        yield
      end
    end
  end
end