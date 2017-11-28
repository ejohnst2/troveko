class HostStoryInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag(:div, super)
  end
end
