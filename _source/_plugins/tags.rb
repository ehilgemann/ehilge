module Jekyll
  class ProjectTag < Liquid::Tag
    def initialize(tag_name, project, tokens)
      super
      arguments = project.split(",")
      @path    = arguments[0].strip
      @project = arguments[1].strip
    end

    def render(context)
      %|<img src="/assets/images/makes/#{@path}/#{@project}.jpg" retina="/assets/images/makes/#{@path}/#{@project}@2x.jpg">|
    end

    Liquid::Template.register_tag "project", self
  end
end